# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_social do
    provider "123"
    user
    uid "123456"
    expire_date "12334"
  end
end
