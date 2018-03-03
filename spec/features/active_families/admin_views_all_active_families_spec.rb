require "rails_helper"

feature "Admin sees all the active families" do
  scenario "successfully" do
    create(:all_true_family)
    create(:all_false_family)

    visit families_path
    click_link(I18n.t("families.index.buttons.active"))

    expect(page).to have_content("true", count: 3)
    expect(page).not_to have_content("false")
  end
end
