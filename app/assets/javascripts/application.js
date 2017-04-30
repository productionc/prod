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
//= require toastr
//= require moment
//= require bootstrap-datetimepicker.min
//= require sweetalert.min
//= require modernizr
//= require modernizr.custom
//= require jquery.flexslider
//= require jquery.validationEngine
//= require jquery.validationEngine-en
//= require custom-script
//= require jquery.dlmenu
//= require ckeditor/init
//= require application_helper

$(function() {
    Pusher.logToConsole = true;

    var pusher = new Pusher('4faead029d9c7bffd984', {
      encrypted: true
    });

    var channel = pusher.subscribe('my-channel');
    channel.bind('my-event', function(data) {
      $.post("/process_notification",
      {
        event_id: data.message
      },
      function(can_notify){
          if(can_notify)
          {
          toastr.success('Open up', 'You have got a new notification!')
          $.post("/add_notification",
          {
           event_id: data.message,
           notification_type_id: 1,
          },
          function(msg){
          });
          }
        });
      });
});


$(document).ready(function() {

 $(".dept_stream_field").hide();
  $(".dept_field").hide();
  $(".college_field").hide();
  $(".college_joined_year_field").hide();
  $(".company_field").hide();
  $(".official_email_id_field").hide();
$('#user_registration_type').change(function () {
  
  // $('#user_dept, #user_dept_label').css('display','none');
  // $('#user_passed_out_year, #user_passed_out_year_label').css('display','none');
  // $('#user_place_of_study, #user_place_of_study_label').css('display','none');
  // $('#user_official_email_id, #user_official_email_id_label').css('display','none');
  // $('#user_company, #user_company_label').css('display','none');
  // $("#user_stream_label").hide();
  $(".dept_stream_field").hide();
  $(".dept_field").hide();
  $(".college_field").hide();
  $(".college_joined_year_field").hide();
  $(".company_field").hide();
  $(".official_email_id_field").hide();
 
      
  if(($(this).val() == "Student-Passout") || ($(this).val() == "Student-Studying") ){
    $(".dept_stream_field").show();
    $(".dept_field").show();
    $(".college_field").show();
    $(".college_joined_year_field").show();

    // $('#user_dept, #user_dept_label').css('display','block');
    // $('#user_passed_out_year, #user_passed_out_year_label').css('display','block');
    // $('#user_place_of_study, #user_place_of_study_label').css('display','block');
    // $(".select2-container").show(); $("#user_stream_label").show();
    // $("span.select2.select2-container.select2-container--default").css('display', 'block');
  }
  // else if($(this).val() == "Student-Studying"){

    // $('#user_dept, #user_dept_label').css('display','block');
    // $('#user_passed_out_year, #user_passed_out_year_label').css('display','block');
    // $('#user_place_of_study, #user_place_of_study_label').css('display','block');
    // $(".select2-container").show(); $("#user_stream_label").show();
    // $("span.select2.select2-container.select2-container--default").css('display', 'block');
  // }
  else if($(this).val() == "Teacher"){
    $(".dept_stream_field").show();
    $(".dept_field").show();
    $(".college_field").show();
    // $('#user_dept, #user_dept_label').css('display','block');
    // $('#user_place_of_study, #user_place_of_study_label').css('display','block');
    // $("span.select2.select2-container.select2-container--default").css('display', 'none');
    // $("span.select2.select2-container.select2-container--default").css('display', 'block');
    // $("#user_stream_label").show();
  }
  else if($(this).val() == "Employer"){
    $(".company_field").show();
    $(".official_email_id_field").show();
    // $('#user_official_email_id, #user_official_email_id_label').css('display','block');
    // $('#user_company, #user_company_label').css('display','block');
    // $("span.select2.select2-container.select2-container--default").css('display', 'none');
    // $('#user_passed_out_year, #user_passed_out_year_label').css('display','block');
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

$('.department_stream').change(function () {
  var input_state = $('.department');
  $.getJSON('/departments/' + $(this).val(), function (data) {
    input_state.empty();
    var initial = "<option value=''>Select Department</option>";
    input_state.append(initial);
    $.each(data, function (i,j) {
     var opt = '<option value='+ j["id"] +'>' + j["name"] + '</option>';
      input_state.append(opt);
    });
  });
});

$('.department').change(function () {
  $('.filter_result').click();
});

});