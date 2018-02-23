require "rails_helper"

feature "Admin can see all the schools in the schools/index page" do
  scenario "successfully" do
    create(:school, name: "St. Patrick")

    visit schools_path

    expect(page).to have_text(I18n.t("schools.index.title"))
    expect(page).to have_text("St. Patrick")
  end
end
