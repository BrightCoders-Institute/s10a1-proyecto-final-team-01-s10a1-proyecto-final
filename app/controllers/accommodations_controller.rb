class AccommodationsController < ApplicationController
  before_action :get_detail_ids, only: %i[ create update ]
  before_action :set_accommodation, only: %i[ show edit update destroy ]

  def index
    @accommodations = Accommodation.all
    date_filter = params[:date_filter]

    filtering_params(params).each do |key, value|
      if value.present? && !value.empty? && (date_filter.present? || key != "dates_range")
        puts "#{key} => #{value}"
        @accommodations = @accommodations.public_send("filter_by_#{key}", value)
      end
    end

    @pagy, @accommodations = pagy(@accommodations)
  rescue Pagy::VariableError
    redirect_to accommodations_path(page: 1)
  end

  def show
    @pagy, @reviews = pagy(@accommodation.reviews)
  rescue Pagy::VariableError
    redirect_to accommodation_path(@accommodation, page: 1)
  end

  def new
    @accommodation = Accommodation.new
  end

  def edit
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.detail_ids = @detail_ids

    if @accommodation.save
      redirect_to @accommodation
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @accommodation.detail_ids = @detail_ids

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

    def get_detail_ids
      @detail_ids = params.require(:accommodation).extract!("detail_ids").values[0].map { |id| id.to_i } - [0]
    end

    def accommodation_params
      params.require(:accommodation).permit(:user_id, :category_id, :title, :price_per_day, :main_image,
                                            :rules, :description, :rating, :dates_range, :bedrooms_number,
                                            :bathrooms_number, :beds_number, :max_guests_number, :address, :latitude,
                                            :longitude, secondary_images: [])
    end

    def filtering_params(params)
      params.slice(:hosts_ids, :categories_ids, :details_ids, :title, :price_per_day, :rating, :bedrooms_number,
                   :bathrooms_number, :beds_number, :max_guests_number, :dates_range, :address)
    end
end
