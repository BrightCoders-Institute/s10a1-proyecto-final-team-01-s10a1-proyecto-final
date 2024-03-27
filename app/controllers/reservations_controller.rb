class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  def index
    @reservations = Reservation.all
    date_filter = params[:date_filter]

    filtering_params(params).each do |key, value|
      if value.present? && !value.empty? && (date_filter.present? || key != "dates_range")
        @reservations = @reservations.public_send("filter_by_#{key}", value)
      end
    end

    @pagy, @reservations = pagy(@reservations)
  rescue Pagy::VariableError
    redirect_to reservations_path(page: 1)
  end

  def show; end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to @reservation
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy!
    redirect_to reservations_url
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:user_id, :accommodation_id, :dates_range, :active)
    end

    def filtering_params(params)
      params.slice(:guests_ids, :accommodations_ids, :dates_range, :active)
    end
end
