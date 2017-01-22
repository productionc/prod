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
  
$(function () {
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
