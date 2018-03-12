$(document).on('turbolinks:load', function() {
  var messages, messages_to_bottom;
  messages = $('#messages');
  if ($('#messages').length > 0) {
    messages_to_bottom = function() {
      return messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();
    App.global_chat = App.cable.subscriptions.create({
      channel: "ChatRoomsChannel",
      chat_room_id: messages.data('chat-room-id')
    }, {
      connected: function() {},
      disconnected: function() {},
      received: function(data) {
        messages.append(data['message']);
        return messages_to_bottom();
      },
      send_message: function(message, chat_room_id,current_user_id) {
        return this.perform('send_message', {
          message: message,
          chat_room_id: chat_room_id
        }, current_user_id);
      }
    });
    return $('#new_message').submit(function(e) {
      var $this, textarea, user_id;
      $this = $(this);
      textarea = $this.find('#message_body');
      user_id = $this.find('#current_user_id').val();
      if ($.trim(textarea.val()).length > 1) {
        App.global_chat.send_message(textarea.val(),
          messages.data('chat-room-id'),
          $('#current_user_id').val()
        );
        textarea.val('');
      }
      e.preventDefault();
      return false;
    });
  }
});

$(document).on('turbolinks:load', function(){
  var other_guy = $('.other_guy').text().split(" ")[2];
  var $messages = $('#messages');
  // Select the node that will be observed for mutations
  var targetNode = document.getElementById('messages');
  // Options for the observer (which mutations to observe)
  var config = {childList: true };

  color_bubbles = function(){
    $('#messages div.col.chat-bubble').each(function(index, value){
      var chat_name = $(this).find($('.name')).text().split(" ")[0];
      if (chat_name == other_guy){
        $(this).attr("id",'other-guy-chat');
      }
    });
  };

  var callback = function(mutationsList) {
    for(var mutation of mutationsList) {
      if (mutation.type == 'childList') {
          color_bubbles();
      }
    }
  };

  // Create an observer instance linked to the callback function
  var observer = new MutationObserver(callback);

  // Start observing the target node for configured mutations
  observer.observe(targetNode, config);

  color_bubbles();

  $('#new_message').submit(function(e){
    color_bubbles();
  });
});
