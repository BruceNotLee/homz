// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function(){
  // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered

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
    var apptBody = "Would you like to schedule an appointment to visit this property on "
    $(".appointment").text(apptBody + select + "?");
    $('.modal').modal();
    $('#modal2').modal('open');

    $('#yes').click(function(){
      // $('.modal').modal();
      $('#modal2').modal('close');
      var userId = document.body.getAttribute('data-current-user-id');
      var picOwner = $(this).attr("pic_owner_id")
      var pictureId = $(this).attr("pic_id")
      var params = {"pic_owner_id":picOwner, "title":userId+'-'+pictureId+'-visit', "date":select};
      // "#{current_user.id}-#{picture.id}-visit"
      $.get('/join_chat.js', params, function(){
      });
    });

    $('#no').click(function(){
      $('#modal2').modal('close');
    });
  });

});
