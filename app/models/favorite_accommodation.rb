class FavoriteAccommodation < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  validates :user_id, presence: true
  validates :accommodation_id, presence: true
  validates_inclusion_of :favorite, in: [true, false]
end
