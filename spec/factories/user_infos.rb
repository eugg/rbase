# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_info do
    username "MyString"
    user_id 1
    gender 1
    birthday "2014-09-09"
    bio "MyText"
    address "MyString"
    avatar "MyString"
  end
end
