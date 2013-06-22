require 'spec_helper'

describe "EvernoteNotifications" do
  describe "GET /evernote_notifications" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get evernote_notifications_path
      response.status.should be(200)
    end
  end
end
