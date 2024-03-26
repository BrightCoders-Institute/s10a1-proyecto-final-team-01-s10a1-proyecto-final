class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  validates :user_id, presence: true
  validates :accommodation_id, presence: true
  validates :dates_range, presence: true
  validates_inclusion_of :active, in: [true, false]
  validate :accommodation_has_an_available_dates_range, :user_is_a_guest, on: :save

  scope :filter_by_guest_id, ->(guest_id) { where(user_id: guest_id).order(updated_at: :desc) }

  def user_is_a_guest
    unless User.find(user_id).is_a_guest?
      errors.add(:user_id, "The specified user is not a guest")
    end
  end

  def accommodation_has_an_available_dates_range
    unless reservation_dates_matches_accommodation?(Accommodation.find(accommodation_id).dates_range) &&
           reservation_dates_are_available?
      errors.add(:user_id, "The reservation is not available on the specified dates range")
    end
  end

  private

  def reservation_dates_are_available?
    return false if dates_range.nil?

    Reservation.where(accommodation_id: accommodation_id, active: true).where.not(id: id).none? do |reservation|
      Accommodation.dates_range_overlap?(dates_range, reservation.dates_range)
    end
  end

  def reservation_dates_matches_accommodation?(accommodation_dates_range)
    return false if dates_range.nil?

    Accommodation.dates_range_covers_the_second_one?(accommodation_dates_range, dates_range)
  end
end
