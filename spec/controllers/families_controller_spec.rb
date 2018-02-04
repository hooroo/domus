require "rails_helper"

RSpec.describe FamiliesController do
  describe "POST /families" do
    context "when invalid params" do
      it "doesn't create a new family" do
        expect do
          post :create, params: { family: { first_name: "John" } }
        end.not_to change(Family, :count)
      end

      it "sets an alert message" do
        post :create, params: { family: { first_name: "John" } }

        expect(flash[:alert])
          .to match(
            I18n.t("flash.actions.create.alert", resource_name: "Family")
          )
      end

      it "renders the form to add a new family again" do
        post :create, params: { family: { first_name: "John" } }

        expect(response).to render_template("new")
      end
    end
  end

  describe "GET /families/:id" do
    it "returns the show family" do
      family = create(:family)

      get :show, params: { id: family.id }

      expect(response).to render_template("show")
    end
  end
end
