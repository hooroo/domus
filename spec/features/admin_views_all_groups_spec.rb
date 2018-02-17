require "rails_helper"

feature "Admin can see all the groups in the groups/index page" do
  scenario "successfully" do
    group = create(:group, name: "St. Patrick")

    visit groups_path

    expect(page).to have_text(I18n.t("groups.index.title"))
    expect(page).to have_text("St. Patrick")
  end
end
