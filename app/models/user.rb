class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_many :usrs
  has_many :user_orders, dependent: :destroy

  has_many :friend_ships, dependent: :destroy
  # acts_as_target

  has_and_belongs_to_many :groups

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.image = auth.info.image
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = Devise.friendly_token[0,20]
      user.save!
      # user.oauth_token = auth.credentials.token
      # user.first_name = auth.auth.info.first_name
      # user.last_name = auth.auth.info.last_name
      # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  end
end
end