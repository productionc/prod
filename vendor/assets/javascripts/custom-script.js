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
  $('#eventregistrationform #eventstartdate').datetimepicker({
    format: 'DD-MM-YYYY'
  });
  $('#eventregistrationform #eventenddate').datetimepicker({
    format: 'DD-MM-YYYY'
  });
  $('#eventregistrationform #event_reg_opens').datetimepicker({
    format: 'DD-MM-YYYY'
  });
  $('#eventregistrationform #event_reg_closed').datetimepicker({
    format: 'DD-MM-YYYY'
  });

});
