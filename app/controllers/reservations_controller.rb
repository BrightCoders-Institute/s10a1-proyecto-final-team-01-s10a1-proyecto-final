class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :check_if_guests_are_available, only: %i[ new ]
  before_action :check_if_is_owner_or_admin, only: %i[ edit update destroy ]
  before_action :check_if_is_guest_or_admin, only: %i[ new create ]

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

    def check_if_is_guest_or_admin
      unless current_user.is_a_guest_or_admin?
        redirect_to reservations_path(page: 1), notice: "Only guests and admin are allowed to create reservations."
      end
    end

    def check_if_is_owner_or_admin
      unless @reservation.user.id == current_user.id || current_user.is_an_admin?
        redirect_to reservations_path(page: 1), notice: "Only owners and admin are allowed to manage reservations."
      end
    end

    def check_if_guests_are_available
      redirect_to accommodations_path(page: 1) unless User.guests_count > 0
    end

    def reservation_params
      params.require(:reservation).permit(:user_id, :accommodation_id, :dates_range, :active)
    end

    def filtering_params(params)
      params.slice(:guests_ids, :accommodations_ids, :dates_range, :active)
    end
end
