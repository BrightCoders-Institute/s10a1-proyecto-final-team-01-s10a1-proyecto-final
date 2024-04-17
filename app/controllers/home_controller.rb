# frozen_string_literal: true

# Home's Controller
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @images = ['fondo01.jpg', 'fondo02.jpg', 'fondo03.jpg','fondo04.jpg','fondo05.jpg','fondo06.jpg']
  end
end
