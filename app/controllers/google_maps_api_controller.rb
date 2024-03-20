class GoogleMapsApiController < ApplicationController
  before_action :authenticate_user!
  
  def show
    render json: { api_key: Rails.application.credentials.google_maps_api_key }
  end
end
