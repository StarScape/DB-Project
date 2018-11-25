Vue.component('reservation-search', {
  template: '#reservation-search-template',
  data: function () {
    return {
      selectedHall: "",
      selectedRoom: null,
      
      residenceHalls:  [
        "Appalachian Heights",
        "Appalachian Panhellenic Hall",
        "Belk Hall",
        "Bowie Hall ",
        "Cannon Hall ",
        "Coltrane Hall ",
        "Cone Hall ",
        "Doughton Hall ",
        "East Hall ",
        "Eggers Hall ",
        "Frank Hall ",
        "Gardner Hall ",
        "Hoey Hall ",
        "Justice Hall ",
        "Living Learning Center ",
        "Lovill Hall ",
        "Mountaineer Hall ",
        "Newland Hall",
        "Summit Hall",
        "White Hall"
      ],

      reservations: [],
      searchSent: false,

      newReservationStart: "",
      newReservationEnd: "",
      reservationCreated: false
    }
  },

  mounted: function() {
  },

  methods: {
    submitSearch: function() {
      this.searchSent = true;
      $.get('reservations/find', { building: this.selectedHall, room: this.selectedRoom }, (data) => {
        if (data['room_exists']) {
          this.reservations = data.reservations;
        }
        else {
          alert('Room does not exist.');
        }
      });

      // Datepickers done with jQuery b.c. lazy
      Vue.nextTick(() => {
        this.$el.querySelectorAll('.datepicker').forEach((elem) => {
          $(elem).datepicker();
        });
      });
    },

    createReservation: function() {
      // Get data manually b.c of jQuery/Vue interrop weirdness
      let reservationStart = $('#start-date').datepicker('getDate');
      let reservationEnd = $('#end-date').datepicker('getDate');

      $.post('reservations/new', {
        building: this.selectedHall,
        room: this.selectedRoom,
        start: reservationStart,
        end: reservationEnd
      }, (data) => {
        if (data.success) {
          this.reservationCreated = true;
          setTimeout(() => window.location.reload(), 1000)
        }
      });
    },

    deleteReservation: function(reservation) {
      $.ajax({
        type: 'DELETE',
        url: 'reservations/delete',
        data: { 'reservation_id': reservation.id },
        success: (data) => {
          if (data.success) {
            this.reservations = this.reservations.filter(val => val != reservation);
          }
          else {
            alert("The database cannot complete the action at the given time.");
          }
        }
      });
    },

    // Updates the checkout status of the reservation
    updateReservation: function(reservation, checkedIn) {
      $.post('reservations/update', { 'id': reservation.id, 'checked_in': checkedIn }, (data) => {
        if (data.success) {
          reservation.checked_in = checkedIn;
        }
      });
    },

    formatDate: function(string) {
      let date = new Date(Date.parse(string));
      var day = date.getDate();
      var monthIndex = date.getMonth();
      var year = date.getFullYear();
      var monthNames = [
        "January", "February", "March",
        "April", "May", "June", "July",
        "August", "September", "October",
        "November", "December"
      ];

      return day + ' ' + monthNames[monthIndex] + ', ' + year;
    }
  }
});