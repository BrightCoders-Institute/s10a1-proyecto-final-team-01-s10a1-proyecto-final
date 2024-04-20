# frozen_string_literal: true

# Home's Controller
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @images = ['fondo01.webp', 'fondo02.webp', 'fondo03.webp', 'fondo04.webp', 'fondo05.webp', 'fondo06.webp']
  end
end
