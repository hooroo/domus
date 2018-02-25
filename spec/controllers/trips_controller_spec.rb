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

  describe "PUT /trips/:id" do
    context "when invalid params" do
      it "does not update the trip" do
        trip = create(:trip, total_girls: 15)

        put :update, params: { id: trip.id, trip: { total_girls: "seventeen" } }

        expect(trip.total_girls).to eq 15
      end
    end

    context "When trip does not exist" do
      it "raises a record not found error" do
        expect do
          put :update, params: { id: 3, trip: { total_girls: 20 } }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
