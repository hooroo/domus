require "rails_helper"

feature "Admin can see all the active families when in families#index" do
  scenario "successfully", js: true do
    create(:all_true_family)
    create(:all_false_family)

    visit families_path
    find("#active_families_button").click

    expect(page).to have_text(I18n.t("families.index.buttons.active"))
    expect(page).to have_text(true)
    expect(page).not_to have_text(false)
  end
end
