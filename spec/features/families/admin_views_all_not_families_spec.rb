require "rails_helper"

feature "Admin can see all the not active families when in families#index" do
  context "when click on the 'Not Active' button" do
    scenario "successfully" do
      create(:family, active: false, last_name: "Scara")

      visit families_path
      find("#inactive_families_button").click

      expect(page).to have_text(I18n.t("families.index.inactive_families"))
      expect(page).to have_text("false")
      expect(page).to have_text("Scara")
    end
  end
end
