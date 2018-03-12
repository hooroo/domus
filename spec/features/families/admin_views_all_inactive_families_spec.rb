require "rails_helper"

feature "Admin can see all the not active families when in families#index" do
  context "when click on the 'Not Active' button" do
    scenario "successfully", js: true do
      create(:all_true_family)
      create(:all_false_family)

      visit families_path
      find("a", text: "INACTIVE").click

      expect(page).to have_content("false", count: 3)
      expect(page).not_to have_content("true")
    end
  end
end
