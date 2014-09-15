class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :weibo]

  has_many :user_socials, dependent: :destroy

  enum gender: [:other, :male, :female]

  enum role: [:member, :project_owner, :admin]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.social_data"] && session["devise.social_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"] if user.name.blank?
        user.gender = generalize_gender(data["gender"]) if user.gender.blank?
        user.avatar = data["picture"] if user.avatar.blank?
      end
    end
  end

  def create_user_social(data)
    hash = {}
    hash["provider"] = data["provider"]
    hash["uid"] = data["uid"]
    hash["expire_date"] = data["credentials"]["expires_at"]
    hash["token"] = data["credentials"]["token"]
    hash["last_sign_in_at"] = Time.now
    user_socials.create(hash)
  end

  def self.generalize_gender(gender)
    if gender == "m"
      "male"
    elsif gender == "f"
      "female"
    else
      "other"
    end
  end
end
