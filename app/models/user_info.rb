class UserInfo < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "user_id"

  enum gender: [:other, :male, :female]
end
