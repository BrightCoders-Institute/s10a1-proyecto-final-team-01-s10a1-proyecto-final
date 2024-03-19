class Review < ApplicationRecord
  belongs_to :user
  belongs_to :accommodation

  has_rich_text :content

  validates :user_id, presence: true
  validates :accommodation_id, presence: true
  validates :title, presence: true
end
