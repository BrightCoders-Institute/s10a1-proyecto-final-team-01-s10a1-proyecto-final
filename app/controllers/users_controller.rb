# frozen_string_literal: true

# Users' controller
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    
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
end
