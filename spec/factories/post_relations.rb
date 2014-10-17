# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_relation do
    post
    tag
    type PostRelation.types.keys.sample
  end
end
