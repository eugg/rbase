# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { SecureRandom.hex(4) }
    name { Faker::Name.name }
  end
end
