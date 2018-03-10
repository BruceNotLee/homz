class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  def timestamp
    created_at.strftime('%_m/%d %_l:%_M%P')
  end

  after_create_commit do
    MessageBroadcastJob.perform_later(self)
  end

end
