# frozen_string_literal: true

# Users' controller
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @chat_rooms = ChatRoom.public_rooms
    @users = User.all_except(current_user)
    @chat_room = ChatRoom.new
    @message = Message.new
    @chat_room_name = get_name(@user, @current_user)
    @single_chat_room = ChatRoom.find_by_name(@chat_room_name) || ChatRoom.create_private_room([@user, @current_user], @chat_room_name)
    @messages = @single_chat_room.messages.order(created_at: :asc)

    render "chat_rooms/index"
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to profile_path, notice: 'The user has been successfully updated.'
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_profile_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :emergency_contact, :image)
  end
  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
