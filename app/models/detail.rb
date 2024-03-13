class Detail < ApplicationRecord
  belongs_to :accommodation

  validates :name, presence: true
end
