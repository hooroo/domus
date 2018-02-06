require "rails_helper"

feature "Admin can see a family" do
  scenario "successfully" do
    family = create(:family, last_name: "Yellow")

    visit family_path(family)

    expect(page).to have_text(I18n.t("families.show.title"))
    expect(page).to have_text("Yellow")
  end
end
