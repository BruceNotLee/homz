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
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require cable
//= require materialize
//= require_tree .

$( document ).on('turbolinks:load', function() {
 console.log("It works on each visit!")
 var lat;
 var lng;
 var point;
 $("#location").addClass('disabled')
 if(navigator.geolocation) {
   navigator.geolocation.getCurrentPosition(function(position) {
     console.log(position.coords);
     lat = position.coords.latitude;
     long = position.coords.longitude;
     point = new google.maps.LatLng(lat, long);
     $("#location").removeClass('disabled')
   });
 }
 $(document).one('click', '#location:not(.disabled)', function(e){
   e.preventDefault()
   if(navigator.geolocation) {
     new google.maps.Geocoder().geocode(
       {'latLng': point},
       function (res, status) {
         var zip = res[0].formatted_address.match(/,\s\w{2}\s(\d{5})/);
         console.log(zip[1]);
       }
     );
   } else {
     alert('Enable your location in the browser.')
   }
 });
});
