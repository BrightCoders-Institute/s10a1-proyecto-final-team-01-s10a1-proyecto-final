class Test < ApplicationRecord
  has_rich_text :content

  has_one_attached :main_image do |attachable|
    attachable.variant :preview, resize_to_limit: [200, 200]
  end

  has_many_attached :secondary_images do |attachable|
    attachable.variant :preview, resize_to_limit: [200, 200]
  end

  validates :main_image, size: { less_than: 10.megabytes }, content_type: ['image/jpg', 'image/png', 'image/jpeg']
  validates :secondary_images, size: { less_than: 10.megabytes }, content_type: ['image/jpg', 'image/png', 'image/jpeg']
end
