require "rails_helper"

feature "Admin can see all the current trips when lands on the index page" do
  scenario "successfully" do
    create(:trip, total_girls: 15)

    visit trips_path

    expect(page).to have_text(I18n.t("trips.index.current_trips"))
    expect(page).to have_text(15)
  end
end
