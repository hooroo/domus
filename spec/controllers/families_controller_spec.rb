require "rails_helper"

# controller specs for the sad path - i.e. trying to create a new family without required attributes => testing to see that the flash message was set correctly, and the rendered template is :new rather than :index, and that the object has error messages on it
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
