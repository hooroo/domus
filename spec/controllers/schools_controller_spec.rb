require "rails_helper"

RSpec.describe SchoolsController do
  describe "GET /schools" do
    context "when invalid params" do
      it "does not create a new school" do
        expect do
          post :create, params: { school: { name: "St. Paul" } }
        end.not_to change(School, :count)
      end

      it "sets an alert message" do
        post :create, params: { school: { name: "St. Paul" } }

        expect(flash[:alert]).to match(
          I18n.t("flash.actions.create.alert", resource_name: "School"),
        )
      end

      it "shows the form again" do
        post :create, params: { school: { name: "St. Paul" } }

        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT /schools/:id" do
    context "when invalid params" do
      it "does not update the school" do
        school = create(:school, name: "St Patrick")

        put :update, params: { id: school.id, school: { name: "" } }

        expect(school.name).to eq "St Patrick"
      end
    end

    context "When school does not exist" do
      it "raises a record not found error" do
        expect do
          put :update, params: { id: 3, school: { name: "Mr Black" } }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "DELETE /schools/:id" do
    context "When school exsist" do
      it "destroys the school" do
        school = create(:school)

        expect do
          delete :destroy, params: { id: school.id }
        end .to change(School, :count).by(-1)
      end

      it "sets a flash notice message and redirects to index" do
        school = create(:school)
        notice = I18n.t("flash.actions.destroy.notice", resource_name: "School")

        delete :destroy, params: { id: school.id }

        expect(flash[:notice]).to match(notice)
        expect(response).to redirect_to schools_path
      end
    end

    context "When school does not exist" do
      it "raises record not found error" do
        expect do
          delete :destroy, params: { id: 3 }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
