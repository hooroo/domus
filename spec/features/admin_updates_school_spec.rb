require "rails_helper"

feature "Admin updates a school" do
  scenario "successfully" do
    school = create(:school)

    visit edit_school_path(school)

    fill_in "school_name", with: "New Name"
    click_on I18n.t("schools.form.submit")

    expect(page).to have_text(
      I18n.t("flash.actions.update.notice", resource_name: "School"),
    )
    expect(page).to have_text "New Name"
  end
end
