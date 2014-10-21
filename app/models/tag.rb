class Tag < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_many :post_relations
  has_many :posts, through: :post_relations

  accepts_nested_attributes_for :posts, allow_destroy: true

  validates :name_zh, presence: true
  validates :name_en, presence: true
  validates :tag_type, presence: true

  enum tag_type: [:category, :tag]

  def slug_candidates
    [
      :name_zh,
      [:name_zh, :name_en]
    ]
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
