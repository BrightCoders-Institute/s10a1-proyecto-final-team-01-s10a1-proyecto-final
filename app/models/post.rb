class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy, autosave: true

  has_rich_text :content

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
end
