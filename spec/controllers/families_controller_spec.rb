require 'rails_helper'

# controller specs for the sad path -
# i.e. trying to create a new family without required attributes
# => testing to see that the flash message was set correctly,
# and the rendered template is :new rather than :index, and
# that the object has error messages on it

RSpec.describe FamiliesController do
  describe "POST /families" do
    it "creates a new family without correct attribute" do
      family_params = attributes_for(:family, last_name: nil, capability: "2")

      expect { post :create, params: { family: family_params } }.to change(Family, :count).by(0)
    end

    it "increases the count of the families by one" do
      family_params = attributes_for(:family, last_name: "Scaramella", capability: "2")

      expect { post :create, params: { family: family_params } }.to change(Family, :count).by(1)
    end
  end
end
