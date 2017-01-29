this.ApplicationHelper = {
  notify: function(message, type) {
    if (message == null) {
      message = '';
    }
    if (type === 'notice' || type === '' || type === null) {
      type = 'success';
    }
    toastr.options = {
      "closeButton": true
    };
    return toastr[type](message);
  }
};