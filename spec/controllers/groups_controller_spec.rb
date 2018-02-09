require 'rails_helper'

RSpec.describe GroupsController do
  describe "GET /groups" do
    context "when invalid params" do
      it "does not create a new group" do
        expect do
          post :create, params: { group: { name: "St. Paul" } }
        end.not_to change(Group, :count)
      end

      it "sets an alert message" do
        post :create, params: { group: { name: "St. Paul" } }

        expect(flash[:alert]).to match(
          I18n.t("flash.actions.create.alert", resource_name: "Group")
        )
      end

      it "shows the form again" do
        post :create, params: { group: { name: "St. Paul" } }

        expect(response).to render_template("new")
      end
    end
  end
end
