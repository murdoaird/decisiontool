require "spec_helper"

describe DecisionElementsController do
  describe "routing" do

    it "routes to #index" do
      get("/decision_elements").should route_to("decision_elements#index")
    end

    it "routes to #new" do
      get("/decision_elements/new").should route_to("decision_elements#new")
    end

    it "routes to #show" do
      get("/decision_elements/1").should route_to("decision_elements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/decision_elements/1/edit").should route_to("decision_elements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/decision_elements").should route_to("decision_elements#create")
    end

    it "routes to #update" do
      put("/decision_elements/1").should route_to("decision_elements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/decision_elements/1").should route_to("decision_elements#destroy", :id => "1")
    end

  end
end
