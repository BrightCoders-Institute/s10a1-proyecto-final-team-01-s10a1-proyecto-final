class User < ApplicationRecord
  has_one_attached :image

  before_create :set_default_role
  after_destroy :delete_messages

  after_create_commit { broadcast_append_to "users" }

  belongs_to :role
  has_many :messages
  has_many :posts, dependent: :destroy, autosave: true
  has_many :comments, dependent: :destroy, autosave: true
  has_many :accommodations, dependent: :destroy, autosave: true
  has_many :reviews, dependent: :destroy, autosave: true
  has_many :reservations, dependent: :destroy, autosave: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2 facebook]

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

  private

  def delete_messages
    Message.where('sender_id = ? OR receiver_id = ?', self.id, self.id).map(&:destroy)
  end
end
