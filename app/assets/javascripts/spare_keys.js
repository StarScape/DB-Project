var vm = new Vue({
  el: "#vue-app",
    data: function () {
    return {
      selectedHall: null,
      selectedRoom: null,
      bannerID: null,
      keys: [],
      checkinClicked: false,
      
      residenceHalls:  ["Appalachian Heights", "Appalachian Panhellenic Hall", "Belk Hall", "Bowie Hall ", "Cannon Hall ", "Coltrane Hall ", "Cone Hall ", "Doughton Hall ", "East Hall ", "Eggers Hall ", "Frank Hall ", "Gardner Hall ", "Hoey Hall ", "Justice Hall ", "Living Learning Center ", "Lovill Hall ", "Mountaineer Hall ", "Newland Hall", "Summit Hall", "White Hall"]
    }
  },

  methods: {
    findKeys: function() {
      $.get('keys/find', { building: this.selectedHall, room: this.selectedRoom }, (data) => {
        if (data['room_exists']) {
          this.keys = data.keys;
        }
        else {
          alert('Room does not exist.');
        }
      });
    },

    checkin: function(key) {
      $.post('keys/update', {
        building: this.selectedHall,
        room: this.selectedRoom,
        key_id: key.id,
        checkout_status: false
      }, (data) => {
        if (data.success) {
          this.findKeys();
        }
        else {
          alert("There was an error");
        }
      });
    },

    checkout: function(key, bannerID) {
      $.post('keys/update', {
        building: this.selectedHall,
        room: this.selectedRoom,
        bannerID: bannerID,
        key_id: key.id,
        checkout_status: true
      }, (data) => {
        if (data.success) {
          this.findKeys();
        }
        else {
          alert("There was an error");
        }
      });
    },

    formatCheckoutStatus: function(key) {
      if (key.checked_out) {
        return `Checked out by ${key.fname} ${key.lname}`;
      }
      else {
        return "Not checked out";
      }
    }
  }
});