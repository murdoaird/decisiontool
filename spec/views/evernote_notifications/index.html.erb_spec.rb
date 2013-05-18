require 'spec_helper'

describe "evernote_notifications/index" do
  before(:each) do
    assign(:evernote_notifications, [
      stub_model(EvernoteNotification,
        :user_id => "User",
        :note_guid => "Note Guid",
        :action => "Action"
      ),
      stub_model(EvernoteNotification,
        :user_id => "User",
        :note_guid => "Note Guid",
        :action => "Action"
      )
    ])
  end

  it "renders a list of evernote_notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Note Guid".to_s, :count => 2
    assert_select "tr>td", :text => "Action".to_s, :count => 2
  end
end
