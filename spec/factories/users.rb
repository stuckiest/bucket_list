FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    first_name "MyString"
    last_name "MyString"
  end

end
