class Post < ApplicationRecord
  belongs_to :user
  has_many :favorite_posts, dependent: :destroy, autosave: true
  has_many :comments, dependent: :destroy, autosave: true

  has_rich_text :content

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }

  scope :filter_by_users_ids, ->(users_ids) { where(user_id: users_ids).order(updated_at: :desc) }
  scope :filter_by_title, ->(title) { where("title LIKE ?", "%#{title}%").order(updated_at: :desc) }
  scope :filter_by_user_favorites, ->(user_id) { where(id: User.find(user_id).favorite_posts.where(favorite: true).pluck(:post_id)).order(updated_at: :desc) }
end
