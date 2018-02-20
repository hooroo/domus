require "rails_helper"

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
          I18n.t("flash.actions.create.alert", resource_name: "Group"),
        )
      end

      it "shows the form again" do
        post :create, params: { group: { name: "St. Paul" } }

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT /groups/:id" do
    context "when invalid params" do
      it "does not update the group" do
        group = create(:group, name: "St Patrick")

        put :update, params: { id: group.id, group: { name: ""} }

        expect(group.name).to eq "St Patrick"
      end
    end

    context "When group does not exist" do
      it "raises a record not found error" do
        expect do
          put :update, params: { id: 3, group: { name: "Mr Black" } }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "DELETE /groups/:id" do
    context "When group exsist" do
      it "destroys the group" do
        group = create(:group)

        expect do
          delete :destroy, params: { id: group.id }
        end .to change(Group, :count).by(-1)
      end

      it "sets a flash notice message and redirects to index" do
        group = create(:group)
        notice = I18n.t("flash.actions.destroy.notice", resource_name: "Group")

        delete :destroy, params: { id: group.id }

        expect(flash[:notice]).to match(notice)
        expect(response).to redirect_to groups_path
      end
    end

    context "When group does not exist" do
      it "raises record not found error" do
        expect do
          delete :destroy, params: { id: 3 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
