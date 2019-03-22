class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :usrs
  has_many :user_orders, dependent: :destroy
  devise :omniauthable
  # devise :omniauth_providers => [:facebook]
  # devise :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth, signed_in_resource = nil)
  user = User.where(provider: auth.provider, uid: auth.uid).first
  if user.present?
    user
  else
    # Check wether theres is already a user with the same
    # email address
    user_with_email = User.find_by_email(auth.info.email)
    if user_with_email.present?
      user = user_with_email
    else
        user = User.new
        if auth.provider == "facebook"
          user.provider = auth.provider
          user.uid = auth.uid
          user.oauth_token = auth.credentials.token
          user.first_name = auth.extra.raw_info.first_name
          user.last_name = auth.extra.raw_info.last_name
          user.email = auth.extra.raw_info.email
          # Facebook's token doesn't last forever
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          user.save

        elsif auth.provider == "google_oauth2"
          user.provider = auth.provider
          user.uid = auth.uid
          user.oauth_token = auth.credentials.token
          user.first_name = auth.info.first_name
          user.last_name = auth.info.last_name
          user.email = auth.info.email
          # Google's token doesn't last forever
          user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          user.save
        end
    end
  end
  return user
  end
end
# end