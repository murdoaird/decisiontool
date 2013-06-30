# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calculation do
    decision_id 1
    element_id 1
    value "MyString"
  end
end
