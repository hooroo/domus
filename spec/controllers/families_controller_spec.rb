require "rails_helper"

RSpec.describe FamiliesController do
  describe "POST /families" do
    context  "when invalid params" do
      it "doesn't create a new family" do
        expect {
          post :create, params: { family: { first_name: "John" } }
        }.not_to change(Family, :count)
      end

      it "sets an alert message" do
        post :create, params: { family: { first_name: "John" } }

        expect( flash[:alert] ).
          to match(
            I18n.t("flash.actions.create.alert", resource_name: "Family")
          )
      end

      it "renders the form to add a new family again" do
        post :create, params: { family: { first_name: "John" } }

        expect(response).to render_template("new")
      end
    end
  end
end
