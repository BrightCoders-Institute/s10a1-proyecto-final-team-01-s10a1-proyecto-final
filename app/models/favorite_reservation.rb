class FavoriteReservation < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  validates :user_id, presence: true
  validates :reservation_id, presence: true
  validates_inclusion_of :favorite, in: [true, false]
end
