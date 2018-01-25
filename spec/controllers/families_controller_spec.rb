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
end
