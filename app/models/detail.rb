class Detail < ApplicationRecord
  has_and_belongs_to_many :accommodations, autosave: true

  validates :name, presence: true
end
