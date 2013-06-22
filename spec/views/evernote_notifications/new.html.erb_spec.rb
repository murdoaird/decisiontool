require 'spec_helper'

describe "evernote_notifications/new" do
  before(:each) do
    assign(:evernote_notification, stub_model(EvernoteNotification,
      :user_id => "MyString",
      :note_guid => "MyString",
      :action => "MyString"
    ).as_new_record)
  end

  it "renders new evernote_notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", evernote_notifications_path, "post" do
      assert_select "input#evernote_notification_user_id[name=?]", "evernote_notification[user_id]"
      assert_select "input#evernote_notification_note_guid[name=?]", "evernote_notification[note_guid]"
      assert_select "input#evernote_notification_action[name=?]", "evernote_notification[action]"
    end
  end
end
