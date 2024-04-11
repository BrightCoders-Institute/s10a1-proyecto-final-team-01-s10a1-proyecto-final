class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_is_guest_or_admin, only: %i[ create ]
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

    def check_if_is_guest_or_admin
      unless current_user.is_a_guest_or_admin?
        redirect_to reservations_path(page: 1), notice: "Only guests and admin are allowed to create reviews."
      end
    end

    def review_params
      params.require(:review).permit(:user_id, :accommodation_id, :title, :rating, :content)
    end
end
