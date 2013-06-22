require 'spec_helper'

describe "evernote_notifications/show" do
  before(:each) do
    @evernote_notification = assign(:evernote_notification, stub_model(EvernoteNotification,
      :user_id => "User",
      :note_guid => "Note Guid",
      :action => "Action"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/Note Guid/)
    rendered.should match(/Action/)
  end
end
