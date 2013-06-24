require "spec_helper"

describe DecisionsController do
  describe "routing" do

    it "routes to #index" do
      get("/decisions").should route_to("decisions#index")
    end

    it "routes to #new" do
      get("/decisions/new").should route_to("decisions#new")
    end

    it "routes to #show" do
      get("/decisions/1").should route_to("decisions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/decisions/1/edit").should route_to("decisions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/decisions").should route_to("decisions#create")
    end

    it "routes to #update" do
      put("/decisions/1").should route_to("decisions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/decisions/1").should route_to("decisions#destroy", :id => "1")
    end

  end
end
