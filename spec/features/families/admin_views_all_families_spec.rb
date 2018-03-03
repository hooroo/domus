require "rails_helper"

feature "Admin can see all the families in the homepage" do
  scenario "successfully" do
    visit root_path

    expect(page).to have_text(I18n.t("families.index.title"))
  end
end
