// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on("turbolinks:load", function() {
  $("#prop-pics-btn").on("click", function() {
    $('.modal').modal();
    $('#modal2').modal('open');
  });

  $('#conf-pics').click(function() {
    $('.checkbox:checkbox:checked')
    var checkedIds = [];
    $.each($('.checkbox:checkbox'), function(){
      var $this = $(this);
      if ($this.is(':checked')) {
        checkedIds.push($this.attr("id"))
      } else {
      }
    });
    $('#pic-array').val(checkedIds);
    $('#modal2').modal('close');
  });
});
