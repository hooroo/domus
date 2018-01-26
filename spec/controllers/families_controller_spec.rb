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
