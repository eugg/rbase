class Tag < ActiveRecord::Base
  has_many :post_relations

  validates :name_zh, presence: true
  validates :name_en, presence: true
  validates :tag_type, presence: true

  enum tag_type: [:category, :tag]
end
