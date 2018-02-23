require "rails_helper"

RSpec.describe TripsController do
  describe "POST /trips" do
    context "when invalid params" do
      it "does not create a new trip" do
        expect do
          post :create, params: { trip: { total_girls: "five" } }
        end.not_to change(School, :count)
      end

      it "sets an alert message" do
        post :create, params: { trip: { total_girls: "five" } }

        expect(flash[:alert]).to match(
          I18n.t("flash.actions.create.alert", resource_name: "Trip"),
        )
      end

      it "shows the form again" do
        post :create, params: { trip: { total_girls: "five" } }

        expect(response).to render_template("new")
      end
    end
  end
end
