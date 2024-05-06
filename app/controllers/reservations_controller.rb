class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: %i[ show edit update destroy switch_user_favorite ]
  before_action :check_if_guests_are_available, only: %i[ new ]
  before_action :check_if_is_owner_or_admin, only: %i[ edit update destroy ]
  before_action :check_if_is_guest_or_admin, only: %i[ new create ]

  def index
    @reservations = Reservation.all
    date_filter = params[:date_filter]
    user_favorites = params[:user_favorites]

    filtering_params(params).each do |key, value|
      if value.present? && !value.empty? && (date_filter.present? || key != "dates_range") &&
         (user_favorites.present? || key != "user_favorites")
        @reservations = @reservations.public_send("filter_by_#{key}", key == "user_favorites" ? current_user.id : value)
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

  def switch_user_favorite
    favorite_mark_exists = current_user.reservation_favorite_marking_exists?(@reservation.id)
    favorite_marking = FavoriteReservation.find_or_create_by(user_id: current_user.id, reservation_id: @reservation.id)

    if favorite_mark_exists
      favorite_marking.update(favorite: !favorite_marking.favorite)
    else
      favorite_marking.update(favorite: true)
    end

    favorite_marking.save!
    redirect_back(fallback_location: request.referer)
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
      params.slice(:guests_ids, :accommodations_ids, :dates_range, :active, :user_favorites)
    end
end
