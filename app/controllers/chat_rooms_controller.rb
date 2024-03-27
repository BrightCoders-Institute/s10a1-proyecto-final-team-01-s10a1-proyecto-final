class ChatRoomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = ChatRoom.public_rooms
    @users = User.all

  end
end
