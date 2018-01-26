require "rails_helper"

RSpec.describe FamiliesController do
  describe "POST /families" do
    context "with invalid params" do
      it "does not create a new family" do
        family_params = attributes_for(
          :family,
          last_name: nil,
          capability: "2",
        )

        expect do
          post :create, params: { family: family_params }
        end.to change(Family, :count).by(0)
      end
    end
  end
  
  describe "POST /families" do
    it "creates a new family with correct attribute" do
      family_params = attributes_for(:family, last_name: "Scaramella", capability: "2")

      post :create, params: { family: family_params }

      family = Family.last

      expect(family.last_name).to eq "Scaramella"
    end

    it "increases the count of the families by one" do
      family_params = attributes_for(:family, last_name: "Scaramella", capability: "2")

      expect { post :create, params: { family: family_params } }.to change(Family, :count).by(1)
    end
  end
end
