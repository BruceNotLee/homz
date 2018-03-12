(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12&appId=2104613859759856&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

$(document).on('turbolinks:load', function() {
  console.log($('.share-button'));
  $('.share-button').click(function() {
    console.log('click');
    FB.ui({
      method: 'share',
      href: $(this).data('href')
    });
  })
});
