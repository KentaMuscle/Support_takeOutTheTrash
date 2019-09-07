class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable,   omniauth_providers: %i[google_oauth2]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
          uid:      auth.uid,
          provider: auth.provider,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

end
