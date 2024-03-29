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
  validates :title, presence: true
  validates :price_per_day, presence: true

  scope :filter_by_hosts_ids, ->(hosts_ids) { where(user_id: hosts_ids).order(updated_at: :desc) }
  scope :filter_by_categories_ids, ->(categories_ids) { where(category_id: categories_ids).order(updated_at: :desc) }
  scope :filter_by_details_ids, ->(details_ids) { includes(:details).where(details: { id: details_ids }) }

  scope :filter_by_title, ->(title) { where("title LIKE ?", "%#{title}%").order(updated_at: :desc) }
  scope :filter_by_price_per_day, ->(range) { filter_by_range(:price_per_day, range) }
  scope :filter_by_rating, ->(range) { filter_by_range(:rating, range) }
  scope :filter_by_bedrooms_number, ->(range) { filter_by_range(:bedrooms_number, range) }
  scope :filter_by_bathrooms_number, ->(range) { filter_by_range(:bathrooms_number, range) }
  scope :filter_by_beds_number, ->(range) { filter_by_range(:beds_number, range) }
  scope :filter_by_max_guests_number, ->(range) { filter_by_range(:max_guests_number, range) }
  scope :filter_by_address, ->(address) { where("address LIKE ?", "%#{address}%").order(updated_at: :desc) }

  scope :filter_by_range, lambda { |field, range|
    numbers_range = range.split(",").map { |number| number.to_i }.sort
    where(field => numbers_range.first..numbers_range.last).order(updated_at: :desc)
  }

  scope :filter_by_dates_range, lambda { |date_interval|
    lower_date, upper_date = date_interval.split('-').map { |date| Date.parse(date) }.sort

    where(id: select { |accommodation|
      (lower_date..upper_date).overlaps?(Range.new(*accommodation.dates_range.split('-').map { |date| Date.parse(date) }.sort))
    }.map(&:id))
  }
end
