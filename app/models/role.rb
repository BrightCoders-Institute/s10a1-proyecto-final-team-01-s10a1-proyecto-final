class Role < ApplicationRecord
  has_many :users, dependent: :destroy, autosave: true
  validates :name, presence: true
end
