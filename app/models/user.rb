class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
	:omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		user.provider = auth.provider
		user.uid = auth.uid
		user.email = auth.info.email
		user.name = auth.info.name
		user.image = auth.info.image
		user.password = Devise.friendly_token[0,20]

		user.first_name = auth.info.first_name
		user.last_name = auth.info.last_name
		user.fb_link = auth.extra.raw_info.link
		user.gender = auth.extra.raw_info.gender
		user.locale = auth.extra.raw_info.locale
		user.timezone = auth.extra.raw_info.timezone

		user.location = auth.extra.raw_info.location;
	end
  end
end
