class Like < ActiveRecord::Base
  belongs_to :liker, foreign_key: :user_id, class_name: "User"
  belongs_to :target, foreign_key: :user_id, class_name: "User"
end
