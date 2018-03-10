// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function(){
  // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered

  // $('#modal1').modal()
  // $('#modal1').modal('open')
  // $('.datepicker').attr("placeholder", "schedule here");
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: true // Close upon selecting a date,
  });

  $('.datepicker').on("change", function(){
    var select = $(this).val();
    // alert(select);
    var apptBody = "An email will be sent to the seller to schedule an appointment for "
    $(".appointment").text(apptBody + select);
    $('.modal').modal();
    $('#modal2').modal('open');
  });

  $('#yes').click(function(){
    // $('.modal').modal();
    $('#modal2').modal('close');
  });

  $('#no').click(function(){
    $('#modal2').modal('close');
  });



});
