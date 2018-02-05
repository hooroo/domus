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

  describe "DELETE /families/:id" do
    context "When the family id exsist" do
      it "destroys that family" do
        family = create(:family)

        expect { delete :destroy, params: { id: family.id } }.to change(Family, :count).by(-1)
      end

      it "flashes a notice message and render the family list" do
        family = create(:family)

        delete :destroy, params: { id: family.id }

        expect(flash[:notice])
        .to match(
          I18n.t("flash.actions.destroy.notice", resource_name: "Family")
        )
        expect(response).to redirect_to families_path
      end

      context "When the family id doesn't exist" do
        it "flashes an alert message and render the family list" do
        end
      end
    end
  end
end
