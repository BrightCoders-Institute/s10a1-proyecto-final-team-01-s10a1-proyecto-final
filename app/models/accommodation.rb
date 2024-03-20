class Accommodation < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy, autosave: true
  has_many :reservations, dependent: :destroy, autosave: true
  has_and_belongs_to_many :details, dependent: :destroy, autosave: true

  has_rich_text :rules
  has_rich_text :description

  has_one_attached :main_image do |attachable|
    attachable.variant :preview, resize_to_limit: [200, 200]
  end

  has_many_attached :secondary_images do |attachable|
    attachable.variant :preview, resize_to_limit: [200, 200]
  end

  validates :main_image, size: { less_than: 10.megabytes }, content_type: ['image/jpg', 'image/png', 'image/jpeg']
  validates :secondary_images, size: { less_than: 10.megabytes }, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
end
