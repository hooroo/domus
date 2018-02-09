require "rails_helper"

feature "Admin adds a group" do
  scenario "successfully" do
    visit new_group_path

    from_date = Date.today.next_year
    to_date = Date.today.next_year + 5

    fill_in Group.human_attribute_name(:name), with: "St. Peter"
    fill_in Group.human_attribute_name(:responsable_name), with: "Mr. Black"
    fill_in Group.human_attribute_name(:responsable_contact), with: "0045-123-4445"
    select from_date.day, from: "group_from_date_3i"
    select from_date.strftime("%B"), from: "group_from_date_2i"
    select from_date.year, from: "group_from_date_1i"
    select to_date.day, from: "group_to_date_3i"
    select to_date.strftime("%B"), from: "group_to_date_2i"
    select to_date.year, from: "group_to_date_1i"
    click_on I18n.t("groups.form.submit")

    expect(page).to have_text(
      I18n.t("flash.actions.create.notice", resource_name: "Group")
    )
    expect(current_path).to eq groups_path
  end
end
