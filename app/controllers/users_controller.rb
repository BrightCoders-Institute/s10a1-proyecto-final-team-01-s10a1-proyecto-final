# frozen_string_literal: true

# Controlador de Usuario
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
    @user = current_user

    if @user.update(user_params)
      redirect_to profile_path, notice: 'Tu usuario ha sido actualizado correctamente'
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
