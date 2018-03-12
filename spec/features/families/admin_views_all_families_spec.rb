require "rails_helper"

feature "Admin can see all the families when in families#index" do
  describe "when click on the 'All' button" do
    scenario "successfully", js: true do
      create(:all_true_family)
      create(:all_false_family)

      visit families_path

      expect(page).to have_text(I18n.t("families.index.all_families"))
      expect(page).to have_text("Scara")
      expect(page).to have_text("Liso")
    end
  end
end
