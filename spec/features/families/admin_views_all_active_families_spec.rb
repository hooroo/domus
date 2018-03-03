require "rails_helper"

feature "Admin can see all the active families when in families#index" do
  scenario "successfully" do
    visit families_path

    expect(page).to have_text(I18n.t("families.index.active_families"))
  end
end
