require "rails_helper"

feature "Admin can see all the not active families when in families#index" do
  context "when click on the 'Not Active' button" do
    scenario "successfully", js: true do
      create(:all_true_family)
      create(:all_false_family)

      visit families_path
      find("#inactive_families_button").click

      expect(page).to have_text(I18n.t("families.index.buttons.inactive"))
      expect(page).to have_text("false")
      expect(page).not_to have_text("true")
    end
  end
end
