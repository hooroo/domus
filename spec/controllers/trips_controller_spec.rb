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

  describe "DELETE /trips/:id" do
    context "When trip exsist" do
      it "destroys the trip" do
        trip = create(:trip)

        expect do
          delete :destroy, params: { id: trip.id }
        end.to change(Trip, :count).by(-1)
      end

      it "sets a flash notice message" do
        trip = create(:trip)
        notice = I18n.t("flash.actions.destroy.notice", resource_name: "Trip")

        delete :destroy, params: { id: trip.id }

        expect(flash[:notice]).to match(notice)
      end

      it "redirects to index" do
        trip = create(:trip)

        delete :destroy, params: { id: trip.id }

        expect(response).to redirect_to trips_path
      end
    end
  end
end
