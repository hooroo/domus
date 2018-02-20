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
            I18n.t("flash.actions.create.alert", resource_name: "Family"),
          )
      end

      it "renders the form to add a new family again" do
        post :create, params: { family: { first_name: "John" } }

        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE /families/:id" do
    context "When family exsist" do
      it "destroys the family" do
        family = create(:family)

        expect do
          delete :destroy, params: { id: family.id }
        end.to change(Family, :count).by(-1)
      end

      it "sets a flash notice message and redirects to index" do
        family = create(:family)
        notice = I18n.t("flash.actions.destroy.notice", resource_name: "Family")

        delete :destroy, params: { id: family.id }

        expect(flash[:notice]).to match(notice)
        expect(response).to redirect_to families_path
      end
    end

    context "When family does not exist" do
      it "raises record not found error" do
        expect do
          delete :destroy, params: { id: 3 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "PUT /families/:id" do
    context "When family does not exist" do
      it "raises a record not found error" do
        expect do
          put :update, params: { id: 3, family: { last_name: "Dark Blue" } }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
