class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
    chat_room = ChatRoom.find(data['chat_room_id'])
    if current_user.id == chat_room.user_id
      user = ChatInvite.find_by(chat_room_id: chat_room.id).user
    else
      user = User.find(chat_room.user_id)
    end
    NotificationsChannel.broadcast_to(user, user.find_unread_messages.count)
    head :ok
  end
end
