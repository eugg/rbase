# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_social do
    provider Faker::Company.name
    user
    uid Faker::PhoneNumber.phone_number
    expire_date Faker::PhoneNumber.phone_number
    token Faker::Lorem.characters
    last_sign_in_at Time.now + 1
  end
end
