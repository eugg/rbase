class UserSocial < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"

  def self.find_user_by_uid(provider, uid)
    where(provider: provider, uid: uid).first
  end
end
