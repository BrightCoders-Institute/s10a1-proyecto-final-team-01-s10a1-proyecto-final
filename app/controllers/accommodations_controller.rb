class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: %i[ show edit update destroy ]

  def index
    @accommodations = Accommodation.all
  end

  def show
  end

  def new
    @accommodation = Accommodation.new
  end

  def edit
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)

    if @accommodation.save
      redirect_to @accommodation
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to @accommodation
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def remove_image
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: request.referer)
  end

  def destroy
    @accommodation.destroy!
    redirect_to accommodations_url
  end

  private
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end

    def accommodation_params
      params.require(:accommodation).permit(:user_id, :category_id, :name, :price_per_day, :main_image, :rules,
                                            :description, :rating, :dates_range, :bedrooms_number, :bathrooms_number,
                                            :beds_number, :max_guests_number, :address, :latitude, :longitude,
                                            secondary_images: [])
    end
end
