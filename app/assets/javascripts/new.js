$( document ).on('turbolinks:load', function() {
 var lat;
 var lng;
 var point;
 $("#zip_location").addClass('disabled')
 if(navigator.geolocation) {
   navigator.geolocation.getCurrentPosition(function(position) {
     lat = position.coords.latitude;
     long = position.coords.longitude;
     point = new google.maps.LatLng(lat, long);
     $("#zip_location").removeClass('disabled')
   });
 }
 $(document).one('click', '#zip_location:not(.disabled)', function(e){
   e.preventDefault()
   if(navigator.geolocation) {
     new google.maps.Geocoder().geocode(
       {'latLng': point},
       function (res, status) {
         var zip = res[0].formatted_address.match(/,\s\w{2}\s(\d{5})/);
         window.location = '/feed?zip=' + zip[1];
       }
     );
   } else {
     alert('Enable your location in the browser.')
   }
 });
});
