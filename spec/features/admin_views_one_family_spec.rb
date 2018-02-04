require "rails_helper"

feature "Admin can see a family" do
  scenario "successfully" do
    visit family_path

    expect(page).to have_text(I18n.t("families.show.title"))
  end
end
