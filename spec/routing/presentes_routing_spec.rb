require "spec_helper"

describe PresentesController do
  describe "routing" do

    it "routes to #index" do
      get("/presentes").should route_to("presentes#index")
    end

    it "routes to #new" do
      get("/presentes/new").should route_to("presentes#new")
    end

    it "routes to #show" do
      get("/presentes/1").should route_to("presentes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/presentes/1/edit").should route_to("presentes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/presentes").should route_to("presentes#create")
    end

    it "routes to #update" do
      put("/presentes/1").should route_to("presentes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/presentes/1").should route_to("presentes#destroy", :id => "1")
    end

  end
end
