require "spec_helper"

describe ListasController do
  describe "routing" do

    it "routes to #index" do
      get("/listas").should route_to("listas#index")
    end

    it "routes to #new" do
      get("/listas/new").should route_to("listas#new")
    end

    it "routes to #show" do
      get("/listas/1").should route_to("listas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/listas/1/edit").should route_to("listas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/listas").should route_to("listas#create")
    end

    it "routes to #update" do
      put("/listas/1").should route_to("listas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/listas/1").should route_to("listas#destroy", :id => "1")
    end

  end
end
