require "rails_helper"

feature "Admin can see all the trips in the trips/index page" do
  scenario "successfully" do
    create(:trip, total_girls: 15)

    visit trips_path

    expect(page).to have_text(I18n.t("trips.index.title"))
    expect(page).to have_text(15)
  end
end
