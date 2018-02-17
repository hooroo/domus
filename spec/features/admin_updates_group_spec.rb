require "rails_helper"

feature "Admin updates a group" do
  scenario "successfully" do
    group = create(:group)

    visit edit_group_path(group)

    fill_in "group_name", with: "New Name"
    click_on I18n.t("groups.form.submit")

    expect(page).to have_text(
      I18n.t("flash.actions.update.notice", resource_name: "Group")
    )
    expect(page).to have_text "New Name"
  end
end
