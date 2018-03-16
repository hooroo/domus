require "rails_helper"

feature "Admin sees all the current trips" do
  describe "when click on the 'Current trips' button" do
    scenario "successfully" do
      school1 = create(:school, name: "St. Paul")
      school2 = create(:school, name: "St. Peter")
      past_trip = build_stubbed(
        :trip,
        school_id: school1.id,
        start_date: 2.month.ago,
        end_date: 1.month.ago,
      )
      allow(Trip).to receive(:past).and_return([past_trip])

      create(
        :trip,
        school_id: school2.id,
        start_date: 1.month.from_now,
        end_date: 2.month.from_now,
      )

      visit trips_path
      click_link(I18n.t("trips.index.buttons.current"))

      expect(page).to have_text("St. Peter")
      expect(page).not_to have_text("St. Paul")
    end
  end
end
