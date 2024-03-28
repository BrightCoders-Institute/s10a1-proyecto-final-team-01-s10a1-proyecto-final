class AccommodationsOccupationController < ApplicationController
  def show
    accommodation_id = params[:accommodation_id]
    accommodation = Accommodation.exists?(id: accommodation_id) ?
                    Accommodation.find(accommodation_id) :
                    Accommodation.all.first

    render json: {
      min_date: accommodation.min_date,
      max_date: accommodation.max_date,
      dates_ranges: accommodation.another_guests_occupied_reservation_dates(params[:reservation_id])
    }
  end
end