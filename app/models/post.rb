class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy, autosave: true

  validates :title, presence: true
  validates :content, presence: true
end
