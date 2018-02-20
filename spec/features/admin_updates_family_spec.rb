require "rails_helper"

feature "Admin updates a family" do
  scenario "successfully" do
    family = create(:family)

    visit edit_family_path(family)

    fill_in "family_last_name", with: "New Last Name"
    click_on I18n.t("families.form.submit")

    expect(page).to have_text(
      I18n.t("flash.actions.update.notice", resource_name: "Family"),
    )
    expect(page).to have_text "New Last Name"
  end
end
