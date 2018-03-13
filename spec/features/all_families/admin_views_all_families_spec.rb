require "rails_helper"

feature "Admin can see all the families when in families#index" do
  describe "when click on the 'All' button" do
    scenario "successfully" do
      create(:all_true_family)
      create(:all_false_family)

      visit families_path
      click_link("All")

      expect(page).to have_content("true", count: 3)
      expect(page).to have_content("false", count: 3)
    end
  end
end
