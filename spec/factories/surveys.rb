# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    decision_id 1
    a_element_id 1
    b_element_id 1
    a_value "9.99"
    b_value "9.99"
  end
end
