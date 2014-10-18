# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    name_zh Faker::Job.title
    name_en Faker::Job.title
    tag_type Tag.tag_types.keys.sample
  end
end
