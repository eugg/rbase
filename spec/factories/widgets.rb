# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :widget do
    title Faker::Job.title
    content Faker::Lorem.paragraph
    widget_type Widget.widget_types.keys.sample
    link Faker::Internet.http_url
    order 1
  end
end
