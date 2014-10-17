class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_relations

  validates :title, presence: true
  validates :user_id, presence: true
  validates :status, presence: true
  validates :type, presence: true

  enum status: [:draft, :published]
  enum type: [:normal, :portfolio]
end
