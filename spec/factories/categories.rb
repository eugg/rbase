# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    name_zh Faker::Job.title
    name_en Faker::Job.title
  end
end
