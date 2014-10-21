class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  paginates_per 10
  mount_uploader :cover, CoverUploader
  belongs_to :user
  has_many :post_relations
  has_many :tags, through: :post_relations

  accepts_nested_attributes_for :tags, allow_destroy: true

  validates :title, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
  validates :post_type, presence: true

  enum status: [:draft, :publish, :member_only]
  enum post_type: [:posts, :pages, :portfolios] # 用單數的話page在後台會衝到

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
