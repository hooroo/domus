require "rails_helper"

feature "Admin can see all the families when in families#index" do
<<<<<<< HEAD
  context "when click on the 'All' button" do
    scenario "successfully" do
      create(:family, active: false, last_name: "Scara")
      create(:family, active: true, last_name: "Liso")
=======
  describe "when click on the 'All' button" do
    scenario "successfully", js: true do
      create(:all_true_family)
      create(:all_false_family)
>>>>>>> b6c4d17... Add all_true_families and all_false_families traits into factories and use it in the feature specs

      visit families_path
      find("#all_families_button").click

      expect(page).to have_text(I18n.t("families.index.buttons.all"))
      expect(page).to have_text("false")
      expect(page).to have_text("true")
    end
  end
end
