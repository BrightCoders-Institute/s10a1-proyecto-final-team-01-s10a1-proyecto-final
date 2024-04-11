# frozen_string_literal: true

# Profile Controller
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to profile_path, notice: 'Your user has been successfully updated.'
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_profile_path
    end
  end

  def purge_image
    @user = current_user
    @user.image.purge
    redirect_to edit_profile_path, notice: 'The image has been deleted.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :emergency_contact, :image)
  end
end
