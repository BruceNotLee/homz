// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require pickadate/picker
//= require pickadate/picker.date
//= require rails-ujs
//= require materialize
//= require turbolinks
//= require cable
//= require_tree .
$(document).on('turbolinks:load', function(){
  // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered

  // $('#modal1').modal()
  // $('#modal1').modal('open')

  $( ".auth" ).on( "click", function() {
    console.log( 'clicked' );
    $('.modal').modal();
    $('#modal1').modal('open');
  });


});
