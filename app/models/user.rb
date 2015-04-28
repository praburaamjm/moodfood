class User 
	include Mongoid::Document
	include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
	:omniauthable, :omniauth_providers => [:facebook]

  field :provider, :type => String
  field :uid, :type => String
  field :email, :type => String
  field :name, :type => String
  field :image, :type => String
  field :password, :type => String
  field :first_name, :type => String
  field :last_name, :type => String
  field :fb_link, :type => String
  field :gender, :type => String
  field :locale, :type => String
  field :timezone, :type => String
  field :location, :type => String

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
