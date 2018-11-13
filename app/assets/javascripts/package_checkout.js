var vm = new Vue({
  el: "#vue-app",
  data: {
    bannerID: null,
    packages: [],
    student: null
  },
  methods: {
    findStudent: function(student) {
      $.get('./find', { bannerID: this.bannerID }, (data) => {
        this.packages = data.packages;
        this.student = data.student;
      });
    },

    checkoutPackage: function(package) {
      console.log(package);

      $.post('/packages/out', { 'package_id': package.id }, (data) => {
        if (data.success) {
          this.packages = this.packages.filter(val => val != package);
        }
        else {
          alert("The database cannot complete the action at the given time.");
        }
      });
    }
  }
});