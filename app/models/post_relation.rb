class PostRelation < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag

  validates :post_id, presence: true
  validates :tag_id, presence: true
  validates :type, presence: true

  enum type: [:type1, :type2]
end
