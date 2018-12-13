var vm = new Vue({
  el: "#vue-app",
  data: {
    selectedStudent: null,
    perishable: null,
    statusMessage: "",
  },
  methods: {
    studentSelected: function(student) {
      this.selectedStudent = student;
    },

    registerPackage: function() {
      this.statusMessage = "Waiting for server...";

      $.post('/packages/in', {
        "perishable": this.perishable == 'true',
        "student_id": this.selectedStudent.id
      }, (data) => {
        this.statusMessage = data.msg;
      });
    }
  }
});
