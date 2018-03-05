require "rails_helper"

feature "Admin can see all the families when in families#index" do
  describe "when click on the 'All' button" do
    scenario "successfully" do
      create(:family, active: false, last_name: "Scara")
      create(:family, active: true, last_name: "Liso")

      visit families_path
      find("#all_families_button").click

      expect(page).to have_text(I18n.t("families.index.buttons.all"))
      expect(page).to have_text("false")
      expect(page).to have_text("Scara")
      expect(page).to have_text("true")
      expect(page).to have_text("Liso")
    end
  end
end
