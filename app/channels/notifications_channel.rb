class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from 'notification'"
    user = User.find(current_user.id)
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
