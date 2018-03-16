require "rails_helper"

feature "Admin sees all the past trips" do
  describe "when click on the 'Past trips' button" do
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
      click_link(I18n.t("trips.index.buttons.past"))

      expect(page).not_to have_content("St. Peter")
      expect(page).to have_content("St. Paul")
    end
  end
end
