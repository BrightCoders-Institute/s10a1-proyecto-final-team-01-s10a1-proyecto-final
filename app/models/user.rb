class User < ApplicationRecord
  before_create :set_default_role
  belongs_to :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

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
end
