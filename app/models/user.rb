class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one :user_info, dependent: :destroy
  has_many :user_tokens, dependent: :destroy

  def self.from_omniauth(auth)
    user = where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_google_oauth2(access_token, _signed_in_resource = nil)
    data = access_token.info
    user = User.where(email: data["email"]).first
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
        email: data["email"],
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end

  def create_omniauth_user_info(data)
    unless self.user_info
      hash = {}
      hash["username"] = data.info.name
      hash["gender"] = data.extra.raw_info.gender
      hash["avatar"] = data.info.image
      self.create_user_info(hash)
    end
  end

  def create_user_token(data)
    if User.joins(:user_tokens).where(id: self.id, provider: data.provider).empty?
      hash = {}
      hash["provider"] = data.provider
      hash["uid"] = data.uid
      hash["expire_date"] = data.credentials.expires_at
      hash["token"] = data.credentials.token
      hash["last_sign_in_at"] = Time.now
      self.user_tokens.create(hash)
    else
      user_token = self.user_tokens.where(provider: data.provider).first
      hash = {}
      hash["expire_date"] = data.credentials.expires_at
      hash["token"] = data.credentials.token
      hash["last_sign_in_at"] = Time.now
      user_token.update(hash)
    end
  end
end
