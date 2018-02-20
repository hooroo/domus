require "rails_helper"

feature "Admin adds a trip" do
  scenario "successfully" do
    group = create(:group)
    start_date = 5.days.from_now
    end_date = 10.days.from_now

    visit new_trip_path

    fill_in "trip_total_girls", with: 15
    fill_in "trip_total_boys", with: 15
    fill_in "trip_total_teachers", with: 3
    fill_in "trip_total_bus_drivers", with: 2
    select group.name, from: "trip_group_id"
    select start_date.day, from: "trip_start_date_3i"
    select start_date.strftime("%B"), from: "trip_start_date_2i"
    select start_date.year, from: "trip_start_date_1i"
    select end_date.day, from: "trip_end_date_3i"
    select end_date.strftime("%B"), from: "trip_end_date_2i"
    select end_date.year, from: "trip_end_date_1i"
    click_on I18n.t("trips.form.submit")

    expect(page).to have_text(
      I18n.t("flash.actions.create.notice", resource_name: "Trip"),
    )
    expect(current_path).to eq trips_path
  end
end
