class ReviewsController < ApplicationController
  before_action :set_accommodation

  def index; end

  def create
    review = @accommodation.reviews.create!(review_params)
    redirect_to accommodation_path(@accommodation)
  end

  private
    def set_accommodation
      @accommodation = Accommodation.find(params[:accommodation_id])
    end

    def review_params
      params.require(:review).permit(:user_id, :accommodation_id, :title, :rating, :content)
    end
end
