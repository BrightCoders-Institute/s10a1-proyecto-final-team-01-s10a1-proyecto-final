class Accommodation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy, autosave: true
  has_many :reservations, dependent: :destroy, autosave: true

  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
end
