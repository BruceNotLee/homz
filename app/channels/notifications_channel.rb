class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'notification'
    puts "Subbed"
    #user = User.find(params[:id])
    #stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    puts "Unsubed"
  end
end
