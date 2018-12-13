Vue.component('key-checkout', {
  template: '#key-checkout-template',
  props: {
    keyRef: {
      type: Object
    }
  },
  data: function () {
    return {
      buttonClicked: false,
      bannerID: null
    };
  },

  methods: {
    checkout: function() {
      this.buttonClicked = false;
      this.$emit('checkout', this.keyRef, this.bannerID);
    }
  }
});
