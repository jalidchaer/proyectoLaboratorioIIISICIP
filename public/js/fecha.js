$(document).ready(function(){
  $('#my-dialog').modal('show');
  $('.date-picker').datepicker({
    dateFormat: "mm-dd-yy",
    yearRange: "-10:+10",
    changeMonth: true,
    changeYear: true
  });  
});