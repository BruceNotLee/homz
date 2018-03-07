class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  has_many :users, through: :chat_invites

  def unread_msgs(user)
    p user.id
    unread_msgs = []
    msg = messages
    msg.each do |m|
      unread_msgs << m if m.unread == true && m.user_id != user.id
    end
    unread_msgs
  end

  def chat_display_name(user)
    if user_id == user.id
      user = ChatInvite.find_by(chat_room_id: id).user
      "#{user.name} RE: #{title.split('-')[1]}"
    else
      user = User.find(user_id)
      "#{user.name} RE: #{title.split('-')[1]}"
    end
  end
end
