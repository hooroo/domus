require "rails_helper"

feature "Admin adds a school" do
  scenario "successfully" do
    visit new_school_path

    fill_in School.human_attribute_name(:name), with: "St. Peter"
    fill_in School.human_attribute_name(:responsable_name), with: "Mr. Black"
    fill_in "school_responsable_contact", with: "0123456789"
    click_on I18n.t("schools.form.submit")

    expect(page).to have_text(
      I18n.t("flash.actions.create.notice", resource_name: "School"),
    )
    expect(current_path).to eq schools_path
  end
end
