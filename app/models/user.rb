class User < ApplicationRecord
  after_create_commit { broadcast_append_to "users" }

  belongs_to :role
  has_many :messages
  has_many :posts, dependent: :destroy, autosave: true
  has_many :comments, dependent: :destroy, autosave: true
  has_many :accommodations, dependent: :destroy, autosave: true
  has_many :favorite_accommodations, dependent: :destroy, autosave: true
  has_many :favorite_reservations, dependent: :destroy, autosave: true
  has_many :reviews, dependent: :destroy, autosave: true
  has_many :reservations, dependent: :destroy, autosave: true

  has_one_attached :image do |attachable|
    attachable.variant :preview, resize_to_limit: [200, 200]
  end

  validates :role_id, presence: true
  validates :name, length: { maximum: 50 }
  validates :image, size: { less_than: 10.megabytes }, content_type: ['image/jpg', 'image/png', 'image/jpeg']

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  scope :all_except, ->(user) { where.not(id: user) }
  scope :guests_count, ->() { count_users_by_role(4) }
  scope :hosts_count, ->() { count_users_by_role(3) }
  scope :staff_count, ->() { count_users_by_role(2) }
  scope :count_users_by_role, ->(role_id) { where(role_id: role_id).count }

  scope :filter_by_users_ids, ->(users_ids) { where(id: users_ids).order(updated_at: :desc) }
  scope :filter_by_name, ->(name) { filter_by_text('name', name) }
  scope :filter_by_email, ->(email) { filter_by_text('email', email) }
  scope :filter_by_phone, ->(phone) { filter_by_text('phone', phone)}
  scope :filter_by_emergency_contact, ->(emergency_contact) { filter_by_text('emergency_contact', emergency_contact) }
  scope :filter_by_roles_ids, ->(roles_ids) { where(role_id: roles_ids).order(updated_at: :desc) }
  scope :filter_by_text, ->(field, text) { where("#{field} LIKE ?", "%#{text}%").order(updated_at: :desc) }

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.skip_confirmation!
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def image_is_saved_and_exists?
    return false if image.blob.nil?

    image_blob = image.blob
    image.attached? && image_blob.present? && image_blob.persisted?
  end

  def already_reviewed_accommodation?(accommodation_id)
    Review.where(user_id: id, accommodation_id: accommodation_id).count >= 1
  end

  def is_a_guest?
    role_id == Role.find_by(name: 'guest').id
  end

  def is_a_host?
    role_id == Role.find_by(name: 'host').id
  end

  def is_staff?
    role_id == Role.find_by(name: 'staff').id
  end

  def is_an_admin?
    role_id == Role.find_by(name: 'superadmin').id
  end

  def is_a_host_or_admin?
    is_a_host? || is_an_admin?
  end

  def is_a_guest_or_admin?
    is_a_guest? || is_an_admin?
  end

  def accommodation_favorite_marking_exists?(accommodation_id)
    favorite_accomodations_count({accommodation_id: accommodation_id}) > 0
  end

  def marked_accommodation_as_favorite?(accommodation_id)
    favorite_accomodations_count({accommodation_id: accommodation_id, favorite: true}) > 0
  end

  def reservation_favorite_marking_exists?(reservation_id)
    favorite_reservations_count({reservation_id: reservation_id}) > 0
  end

  def marked_reservation_as_favorite?(reservation_id)
    favorite_reservations_count({reservation_id: reservation_id, favorite: true}) > 0
  end

  private

  def favorite_accomodations_count(params)
    favorite_accommodations.where(params).count
  end

  def favorite_reservations_count(params)
    favorite_reservations.where(params).count
  end
end
