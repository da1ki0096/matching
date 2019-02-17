App.message = App.cable.subscriptions.create("MessageChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    return $('#chat-index').append('<li>' + data['message'] + '</li>');
    // Called when there's incoming data on the websocket for this channel
  },

  post: function(message) {
    return this.perform('post',  { message: message });
  }
}, $(document).on('keypress', '[data-behavior~=message_post]', function(event) {
  if (event.keyCode === 13) {
    var chatForm = $('#contents');
    App.message.post(chatForm.val());
    return chatForm.val('');
  }
}));
