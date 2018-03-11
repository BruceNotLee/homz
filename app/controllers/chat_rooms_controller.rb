class ChatRoomsController < ApplicationController
  layout "app_no_container"

  def index
    @chat_rooms = current_user.find_user_rooms
  end

  def new
    @chat_room = ChatRoom.new
  end


  def create
    respond_to do |format|
      format.html do
        @chat_room =  ChatRoom.find_or_create_by(title: params[:title]) do |c|
          c.title = params[:title]
          c.user_id = current_user.id
        end

        if @chat_room.save

          # ChatInvite.find(chat_room_id: @chat_room.id, user_id: params[:pic_owner_id])
          ChatInvite.find_or_create_by(chat_room_id: @chat_room.id, user_id: params[:pic_owner_id]) do |ci|
            ci.chat_room_id = @chat_room.id
            ci.user_id = params[:pic_owner_id]
          end
          redirect_to @chat_room
        else
          render 'new'
        end
      end
      format.js do
        @chat_room =  ChatRoom.find_or_create_by(title: params[:title]) do |c|
          c.title = params[:title]
          c.user_id = current_user.id
        end

        if @chat_room.save

          # ChatInvite.find(chat_room_id: @chat_room.id, user_id: params[:pic_owner_id])
          ChatInvite.find_or_create_by(chat_room_id: @chat_room.id, user_id: params[:pic_owner_id]) do |ci|
            ci.chat_room_id = @chat_room.id
            ci.user_id = params[:pic_owner_id]
          end
          # redirect_to @chat_room
          # redirect_to "/chat_rooms/#{@chat_room.id}"
          Message.create(chat_room_id:@chat_room.id, user:current_user, body: "Hello, I would like to schedule a visit to see your property on #{params[:date]}. Does that work for you?")

          render :js => "window.location.href = '/chat_rooms/#{@chat_room.id}'"
        else
          render 'new'
        end
      end
    end
  end


  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])

    current_user.mark_messages_read(@chat_room)

    @user = current_user
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
