# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
