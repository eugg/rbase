class Widget < ActiveRecord::Base
  validates :title, presence: true
  validates :order, presence: true

  enum widget_type: [:normal, :facebook, :google_map]
end
