class Post < ActiveRecord::Base
  mount_uploader :cover, CoverUploader
  belongs_to :user
  has_many :post_relations

  validates :title, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
  validates :post_type, presence: true

  enum status: [:draft, :publish, :member_only]
  enum post_type: [:posts, :pages, :portfolios]
end
