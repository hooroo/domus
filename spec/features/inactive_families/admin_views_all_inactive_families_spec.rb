require "rails_helper"

feature "Admin can see all the inactive families when in families#index" do
  context "when click on the 'Inactive' button" do
    scenario "successfully" do
      create(:all_true_family)
      create(:all_false_family)

      visit families_path
      click_link(I18n.t("families.index.buttons.inactive"))

      expect(page).to have_content("false", count: 3)
      expect(page).not_to have_content("true")
    end
  end
end
