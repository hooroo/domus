require "rails_helper"

feature "Admin can see all the current trips when lands on the index page" do
  scenario "successfully" do
    create(:trip, total_girls: 15)

    visit trips_path

    expect(page).to have_text(I18n.t("trips.index.current_trips"))
    expect(page).to have_text(15)
  end

  scenario "when click on 'past trips' button can see all the past trips" do
    past_trip = build_stubbed(:trip, start_date: 1.month.ago)
    allow(Trip).to receive(:past).and_return([past_trip])

    visit trips_path

    find("#past_trips_button").click

    expect(page).to have_text(1.month.ago.strftime("%d-%m-%Y"))
  end

  scenario "when click on 'all trips' button can see all the trips" do
    past_trip = build_stubbed(:trip, start_date: 1.month.ago)
    allow(Trip).to receive(:past).and_return([past_trip])

    create(:trip, start_date: 2.months.from_now, end_date: 3.months.from_now)

    visit trips_path

    find("#all_trips_button").click

    expect(page).to have_text(1.month.ago.strftime("%d-%m-%Y"))
    expect(page).to have_text(2.months.from_now.strftime("%d-%m-%Y"))
  end
end
