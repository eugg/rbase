class Category < ActiveRecord::Base
  validates :name_zh, presence: true
  validates :name_en, presence: true
end
