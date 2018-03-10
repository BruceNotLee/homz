class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message,current_user_id =0)
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                 message: render_message(message,current_user_id)
  end

  private

  def render_message(message,current_user_id = 0)
    MessagesController.render partial: 'messages/message', locals: {message: message, current_user_id: current_user_id}
  end
end
