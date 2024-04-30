class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy, autosave: true

  has_rich_text :content

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }

  scope :filter_by_users_ids, ->(users_ids) { where(user_id: users_ids).order(updated_at: :desc) }
  scope :filter_by_title, ->(title) { where("title LIKE ?", "%#{title}%").order(updated_at: :desc) }
end
