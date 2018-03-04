class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

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
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :pictures, through: :favorites
end
