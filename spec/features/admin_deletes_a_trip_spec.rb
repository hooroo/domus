require "rails_helper"

feature "Admin deletes a trip" do
  scenario "successfully" do
    trip = create(:trip)
    message = I18n.t("flash.actions.destroy.notice", resource_name: "Trip")

    visit trips_path
    page.driver.submit :delete, "/trips/#{trip.id}", {}

    expect(page).to have_text(message)
  end
end
