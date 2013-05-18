# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :evernote_notification do
    user_id "MyString"
    note_guid "MyString"
    action "MyString"
    notification_date "2013-05-18 10:46:27"
  end
end
