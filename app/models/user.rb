class User < ApplicationRecord
  has_many :pictures
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :pictures, through: :favorites
  has_many :chat_invites
  has_many :chat_room_invites, through: :chat_invites, source: :chat_room
  has_many :properties

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def name
    email.split('@')[0]
  end

  # creates a new favorite row with picture_id and user_id
  def favorite!(picture)
    self.favorites.create!(picture_id: picture.id)
  end

  # destroys a favorite with matching picture_id and user_id
  def unfavorite!(picture)
    favorite = self.favorites.find_by_picture_id(picture.id)
    favorite.destroy!
  end

  # returns true of false if a picture is favorited by user
  def favorite?(picture)
    self.favorites.find_by_picture_id(picture.id)
  end

  def find_unread_messages
    chat_rooms = self.find_user_rooms

    #check to see if they are the reciepent of any messages
    #in all of the chatrooms they are in
    #find all the unread messages
    unread_msgs = []
    chat_rooms.each do |chat|
      chat.messages.each do |message|
        #find all the unread messages they did not author
        #check to see if those messages are unread
        if message.unread && message.user_id != self.id
          unread_msgs << message
        end
      end
    end
    unread_msgs
  end

  def find_user_rooms
    chat_rooms = ChatRoom.where(user_id: self.id)

    #all the chat rooms they have been invited in
    chat_invites =  ChatInvite.where(user_id: self.id)
    chats = chat_invites.map {|c| ChatRoom.find_by(id: c.chat_room_id)}

    #all of the chat rooms for the current user
    chat_rooms += chats
  end

  def mark_messages_read(chat_room)
    msgs =  chat_room.messages
    msgs.each do |m|
      if m.user_id != self.id && m.unread
        m.unread =  false
        m.save
      end
    end
  end

end
