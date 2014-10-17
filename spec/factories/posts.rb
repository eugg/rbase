# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title Faker::Job.title
    content Faker::Lorem.paragraph
    status Post.statuses.keys.sample
    type Post.types.keys.sample
    user
  end
end
