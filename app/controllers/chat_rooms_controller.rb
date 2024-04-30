class ChatRoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/users/sign_in' unless @current_user
    @chat_rooms = ChatRoom.public_rooms
    @users = User.all_except(@current_user)
    @chat_room = ChatRoom.new
  end
  def create
    @chat_room = ChatRoom.create(name: params["chat_room"]["name"])
  end
  def show
    @current_user = current_user
    @single_chat_room = ChatRoom.find(params[:id])
    @chat_rooms = ChatRoom.public_rooms
    @users = User.all_except(@current_user)
    @chat_room = ChatRoom.new

    @message = Message.new
    @messages = @single_chat_room.messages
    render "index"
  end
end
