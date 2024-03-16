# frozen_string_literal: true

# Home's Controller
class HomeController < ApplicationController
  def index
    @user = current_user
  end
end
