FactoryGirl.define do
  factory :goal do
    title "MyString"
    description "MyString"
    location "MyString"
    completed false
    user_id 1
    category []
  end
end
