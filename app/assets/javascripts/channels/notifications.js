document.addEventListener('turbolinks:load', function() {

  var userId = document.body.getAttribute('data-current-user-id');


  App.cable.subscriptions.create(
    {
      channel: "NotificationsChannel",
      id: userId
    },
    {
      connected: function() {
        // console.log('connected');
      },
      disconnected: function() {
        // console.log('disconnected');
      },
      received: function(data) {
        // console.log('received');
        // console.log(data);
        var notifier = $('#icon-message').find('i').addClass('red-text')
        notifier.addClass('red-text')

      }
    }
  )
});
