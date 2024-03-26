class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  validates :user_id, presence: true
  validates :accommodation_id, presence: true
  validates :dates_range, presence: true
  validates :active, presence: true
end
