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
    select: function(student) {
      this.selectedStudent = student;
      this.$emit('student-selected', student);
    }
  }
});
