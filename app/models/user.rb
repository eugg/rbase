class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :weibo]

  has_many :user_socials, dependent: :destroy
  has_many :posts

  enum gender: [:other, :male, :female]

  enum role: [:member, :project_owner, :admin]

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.social_data"] && session["devise.social_data"]["info"]
        user.email = data["email"] unless user.email?
        user.name = data["name"] unless user.name?
        user.gender = generalize_gender(data["gender"]) unless user.gender?
        user.avatar = data["picture"] || data["image"] unless user.avatar?
        user.skip_confirmation!
      end
    end
  end

  def create_user_social(data)
    hash = {}
    hash["provider"] = data["provider"]
    hash["email"] = data["info"]["email"]
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

  def to_admin!
    update_attributes(role: "admin")
  end

  def to_member!
    update_attributes(role: "member")
  end

  def to_project_owner!
    update_attributes(role: "project_owner")
  end
end
