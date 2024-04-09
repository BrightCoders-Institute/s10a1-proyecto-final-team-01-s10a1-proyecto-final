class User < ApplicationRecord
  has_one_attached :image

  before_create :set_default_role
  after_destroy :delete_messages

  belongs_to :role
  has_many :messages
  has_many :posts, dependent: :destroy, autosave: true
  has_many :comments, dependent: :destroy, autosave: true
  has_many :accommodations, dependent: :destroy, autosave: true
  has_many :reviews, dependent: :destroy, autosave: true
  has_many :reservations, dependent: :destroy, autosave: true

  validates :role_id, presence: true
  validates :name, length: { maximum: 50 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

  scope :guests_count, ->() { count_users_by_role(4) }
  scope :hosts_count, ->() { count_users_by_role(3) }
  scope :staff_count, ->() { count_users_by_role(2) }
  scope :count_users_by_role, ->(role_id) { where(role_id: role_id).count }

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.skip_confirmation!
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def set_default_role
    role = Role.find_by(name: 'guest')
    self.role_id = role.id if role.present?
  end

  def messages
    Message.where("sender_id = ? OR receiver_id = ?", self.id, self.id)
  end

  def already_reviewed_accommodation?(accommodation_id)
    Review.where(user_id: id, accommodation_id: accommodation_id).count >= 1
  end

  def is_a_guest?
    role_id == 4
  end

  def is_a_host?
    role_id == 3
  end

  def is_staff?
    role_id == 2
  end

  def is_an_admin?
    role_id == 1
  end

  def is_a_host_or_admin?
    is_a_host? || is_an_admin?
  end

  def is_a_guest_or_admin?
    is_a_guest? || is_an_admin?
  end

  private

  def delete_messages
    Message.where('sender_id = ? OR receiver_id = ?', self.id, self.id).map(&:destroy)
  end
end
