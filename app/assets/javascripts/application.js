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
//= require moment
//= require bootstrap-datetimepicker.min
//= require modernizr
//= require modernizr.custom
//= require jquery.flexslider
//= require jquery.validationEngine
//= require jquery.validationEngine-en
//= require custom-script
//= require jquery.dlmenu

$(document).ready(function() {

$('#user_registration_type').change(function () {
  
  $('#user_dept, #user_dept_label').css('display','none');
  $('#user_passed_out_year, #user_passed_out_year_label').css('display','none');
  $('#user_place_of_study, #user_place_of_study_label').css('display','none');
  $('#user_official_email_id, #user_official_email_id_label').css('display','none');
  $('#user_company, #user_company_label').css('display','none');
      
  if($(this).val() == "Student-Passout"){
    $("#user_passed_out_year_label").text("Passed out year");
    $('#user_dept, #user_dept_label').css('display','block');
    $('#user_passed_out_year, #user_passed_out_year_label').css('display','block');
    $('#user_place_of_study, #user_place_of_study_label').css('display','block');
  }
  else if($(this).val() == "Student-Studying"){
    $("#user_passed_out_year_label").text("Current year");
    $('#user_dept, #user_dept_label').css('display','block');
    $('#user_passed_out_year, #user_passed_out_year_label').css('display','block');
    $('#user_place_of_study, #user_place_of_study_label').css('display','block');
  }
  else if($(this).val() == "Teacher"){
    $('#user_dept, #user_dept_label').css('display','block');
    $('#user_place_of_study, #user_place_of_study_label').css('display','block');
  }
  else if($(this).val() == "Employer"){
    $('#user_official_email_id, #user_official_email_id_label').css('display','block');
    $('#user_company, #user_company_label').css('display','block');
  }
});

$('.event_type').change(function () {
   $('.filter_result').click();
});

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
  $('.filter_result').click();
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
  $('.filter_result').click();
});

$('.city').change(function () {
  $('.filter_result').click();
});

$("#event_filter_form #date").on("dp.change", function (e) {
  $('.filter_result').click();
});

});