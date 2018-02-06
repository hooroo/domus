require "rails_helper"

feature "Admin adds a family" do
  scenario "successfully" do
    visit new_family_path

    fill_in "family_last_name", with: "Scaramella"
    fill_in "family_capability", with: 2
    click_on I18n.t("families.new.submit")

    expect(page).to have_text(
      I18n.t("flash.actions.create.notice", resource_name: "Family")
    )
    expect(page).to have_text "Scaramella"
    expect(current_path).to eq families_path
  end
end
