class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_rich_text :content

  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
end
