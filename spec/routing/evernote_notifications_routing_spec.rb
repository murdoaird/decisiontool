require "spec_helper"

describe EvernoteNotificationsController do
  describe "routing" do

    it "routes to #index" do
      get("/evernote_notifications").should route_to("evernote_notifications#index")
    end

    it "routes to #new" do
      get("/evernote_notifications/new").should route_to("evernote_notifications#new")
    end

    it "routes to #show" do
      get("/evernote_notifications/1").should route_to("evernote_notifications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/evernote_notifications/1/edit").should route_to("evernote_notifications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/evernote_notifications").should route_to("evernote_notifications#create")
    end

    it "routes to #update" do
      put("/evernote_notifications/1").should route_to("evernote_notifications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/evernote_notifications/1").should route_to("evernote_notifications#destroy", :id => "1")
    end

  end
end
