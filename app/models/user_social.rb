class UserSocial < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"

  def self.find_user_social_by_uid(provider, uid)
    where(provider: provider, uid: uid.to_s).first
  end

  def update_social_data(data)
    hash = {}
    hash["expire_date"] = data["credentials"]["expires_at"]
    hash["token"] = data["credentials"]["token"]
    hash["last_sign_in_at"] = Time.now
    update_attributes(hash)
  end
end
