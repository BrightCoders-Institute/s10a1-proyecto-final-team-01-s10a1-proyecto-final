class FavoritePost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates_inclusion_of :favorite, in: [true, false]
end
