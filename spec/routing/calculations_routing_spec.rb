require "spec_helper"

describe CalculationsController do
  describe "routing" do

    it "routes to #index" do
      get("/calculations").should route_to("calculations#index")
    end

    it "routes to #new" do
      get("/calculations/new").should route_to("calculations#new")
    end

    it "routes to #show" do
      get("/calculations/1").should route_to("calculations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/calculations/1/edit").should route_to("calculations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/calculations").should route_to("calculations#create")
    end

    it "routes to #update" do
      put("/calculations/1").should route_to("calculations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/calculations/1").should route_to("calculations#destroy", :id => "1")
    end

  end
end
