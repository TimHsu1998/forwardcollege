class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :missions
  has_many :comments
  has_many :identifies
  validates :username, :school, :session, :phone, :selfintro,
  :highschool, :year, :major, :nickname, presence: true
  validates :username, presence: true, length: {maximum: 25}
  mount_uploader :image, ImageUploader


  def total_progress
    progress = 0.0
    missions.each do |mission|
      progress = progress + mission.category.points
    end
    progress = progress * 100.0/140.0
    progress
  end

  def admin?
    is_admin
  end

  def self.from_facebook(access_token, signed_in_resoruce=nil)
		data = access_token.info
		identify = Identify.find_by(provider: access_token.provider, uid: access_token.uid)

		if identify
			return identify.user
		else
			user = User.find_by(:email => data.email)
			if !user
				user = User.create(
					username: access_token.extra.raw_info.name,
					email: data.email,
					image: data.image,
					password: Devise.friendly_token[0,20]
				)
			end
			identify = Identify.create(
				provider: access_token.provider,
				uid: access_token.uid,
				user: user
			)
			return user
		end
  end
end
