require "rails_helper"

feature "Admin sees all active and inactive families" do
  describe "when click on the 'All' button" do
    scenario "successfully" do
      create(:all_true_family, last_name: "Russo")
      create(:all_false_family, last_name: "De Luca")

      visit families_path

      expect(page).to have_text("Russo")
      expect(page).to have_text("De Luca")
    end
  end
end
