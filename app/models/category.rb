class Category < ApplicationRecord
  has_many :accommodations, dependent: :destroy, autosave: true

  validates :name, presence: true
end
