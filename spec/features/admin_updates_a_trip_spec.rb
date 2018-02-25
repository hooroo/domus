require "rails_helper"

feature "Admin updates a trip" do
  scenario "successfully" do
    trip = create(:trip)

    visit edit_trip_path(trip)

    fill_in "trip_total_girls", with: 20
    click_on I18n.t("trips.form.submit")

    expect(page).to have_text(
      I18n.t("flash.actions.update.notice", resource_name: "Trip"),
    )
    expect(page).to have_text 20
  end
end
