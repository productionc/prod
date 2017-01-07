// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require bootstrap.min
//= require bootstrapValidator.min
//= require moment
//= require bootstrap-datetimepicker.min
//= require modernizr
//= require jquery.flexslider
//= require custom-script
//= require custom_validation

$(document).ready(function() {
$('.country').change(function () {
  var input_state = $('.state');
  $.getJSON('/states/' + $(this).val(), function (data) {
    input_state.empty();
    var initial = "<option value=''>Select State</option>";
    input_state.append(initial);
    $.each(data, function (i,j) {
     var opt = '<option value='+ i +'>' + j + '</option>';
      input_state.append(opt);
    });
  });

  $.ajax({
    url: '/events',
    success: function(result) {
      // alert(JSON.stringify(result));
      // var event_results = $("#event_results");
      // event_results.empty();
      // event_results.html('<%= will_paginate(@results) %>');
    }
  });

});

$('.state').change(function () {
  var input_state = $('.city');
  $.getJSON('/cities/' + $(this).val()+ '/'+ $('.country').val(), function (data) {
    input_state.empty();
    var initial = "<option value=''>Select City</option>";
    input_state.append(initial);
    $.each(data, function (i,j) {
     var opt = '<option value='+ j +'>' + j + '</option>';
      input_state.append(opt);
    });
  });
});

});