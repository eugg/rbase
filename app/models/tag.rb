class Tag < ActiveRecord::Base
  has_many :post_relations
  has_many :posts, through: :post_relations

  accepts_nested_attributes_for :posts, allow_destroy: true

  validates :name_zh, presence: true
  validates :name_en, presence: true
  validates :tag_type, presence: true

  enum tag_type: [:category, :tag]
end
