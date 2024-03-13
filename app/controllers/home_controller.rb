class HomeController < ApplicationController
  # before_action :authenticate_use
  def index
    @user = current_user
  end
end
