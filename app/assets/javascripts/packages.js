Vue.component('student-search', {
  template: '#student-search-template',
  data: function () {
    return {
      search: "",
      students: [],
      selectedStudent: null
    }
  },
  methods: {
    submitSearch: function() {
      $.get('../students/search', { search: this.search }, (data) => {
        this.students = data;
      });
    },
    foobar: function() {
      console.log(this.selectedStudent);
    }
  }
});

new Vue({
  el: "#vue-app"
})