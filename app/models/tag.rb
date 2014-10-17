class Tag < ActiveRecord::Base
  has_many :post_relations

  validates :name_zh, presence: true
  validates :name_en, presence: true
end
