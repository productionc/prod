$(function() {
  $( '#top_head_menu' ).dlmenu();
});

$(window).load(function(){
  $('#event_slider .flexslider').flexslider({
    animation: "slide",
    animationLoop: false,
    itemWidth: 210,
    itemMargin: 10,
    pausePlay: true,
    start: function(slider){
      $('body').removeClass('loading');
    }
  });
});

$(window).load(function(){
  $('#partners_slider .flexslider').flexslider({
    animation: "slide",
    animationLoop: false,
    itemWidth: 210,
    itemMargin: 10,
    pausePlay: true,
    start: function(slider){
      $('body').removeClass('loading');
    }
  });
});

jQuery(document).ready(function(){
      jQuery('#new_internship .stipendtype_fixed, .edit_internship .stipendtype_fixed').hide();
      jQuery('#new_internship .stipendtype_variable, .edit_internship .stipendtype_variable').hide();
      jQuery('#new_internship .stipendtype_incentive, .edit_internship .stipendtype_incentive').hide();
      jQuery(document).on("click", "#internship_stipend_type_id", function(){
        var chosenval = jQuery(this).val();
        if(chosenval == "1"){
          jQuery('#new_internship .stipendtype_fixed, .edit_internship .stipendtype_incentive').show();
          jQuery('#new_internship .stipendtype_variable, .edit_internship .stipendtype_variable').hide();
          jQuery('#new_internship .stipendtype_incentive, .edit_internship .stipendtype_incentive').hide();
        } else if(chosenval == "2"){
          jQuery('#new_internship .stipendtype_variable, .edit_internship .stipendtype_variable').show();
          jQuery('#new_internship .stipendtype_fixed, .edit_internship .stipendtype_incentive').hide();
          jQuery('#new_internship .stipendtype_incentive, .edit_internship .stipendtype_incentive').hide();
        } else if(chosenval == "3"){
          jQuery('#new_internship .stipendtype_incentive, .edit_internship .stipendtype_incentive').show();
          jQuery('#new_internship .stipendtype_fixed, .edit_internship .stipendtype_incentive').hide();
          jQuery('#new_internship .stipendtype_variable, .edit_internship .stipendtype_variable').hide();
        } else if(chosenval == "4"){
          jQuery('#new_internship .stipendtype_fixed, .edit_internship .stipendtype_incentive').hide();
          jQuery('#new_internship .stipendtype_variable, .edit_internship .stipendtype_variable').hide();
          jQuery('#new_internship .stipendtype_incentive, .edit_internship .stipendtype_incentive').hide();
        } else if(chosenval == "5") {
          jQuery('#new_internship .stipendtype_fixed, .edit_internship .stipendtype_incentive').hide();
          jQuery('#new_internship .stipendtype_variable, .edit_internship .stipendtype_variable').hide();
          jQuery('#new_internship .stipendtype_incentive, .edit_internship .stipendtype_incentive').hide();
        }
        else{
          jQuery('#new_internship .stipendtype_fixed, .edit_internship .stipendtype_incentive').hide();
          jQuery('#new_internship .stipendtype_variable, .edit_internship .stipendtype_variable').hide();   
          jQuery('#new_internship .stipendtype_incentive, .edit_internship .stipendtype_incentive').hide();
        }
      })
    });
  
$(function () {
  $('#new_internship #internstartdate').datetimepicker({});

  $('#event_filter_form #date').datetimepicker({
    format: 'DD-MM-YYYY'
  });
  $('#eventregistrationform #eventstartdate').datetimepicker();
  $('#eventregistrationform #eventenddate').datetimepicker({
    useCurrent: false
  });
  $("#eventregistrationform #eventstartdate").on("dp.change", function (e) {
    $('#eventregistrationform #eventenddate').data("DateTimePicker").minDate(e.date);
  });
  $("#eventregistrationform #eventenddate").on("dp.change", function (e) {
    $('#eventregistrationform #eventstartdate').data("DateTimePicker").maxDate(e.date);
  });


  $('#eventregistrationform #event_reg_opens').datetimepicker();
  $('#eventregistrationform #event_reg_closed').datetimepicker({
    useCurrent: false
  });
  $("#eventregistrationform #event_reg_opens").on("dp.change", function (e) {
    $('#eventregistrationform #event_reg_closed').data("DateTimePicker").minDate(e.date);
  });
  $("#eventregistrationform #event_reg_closed").on("dp.change", function (e) {
    $('#eventregistrationform #event_reg_opens').data("DateTimePicker").maxDate(e.date);
  });

});
