require "rails_helper"

RSpec.describe FamiliesController do
  describe "GET /index" do
    it "is successful" do
      get :index

      expect(response).to be_success
    end

    it "renders the :index view" do
      get :index

      expect(response).to render_template :index
    end
    
    it "returns all the families" do
      create_list(:family, 2)
    end

  end
end
