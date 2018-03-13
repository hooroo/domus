require "rails_helper"

feature "Admin can see all the active families when in families#index" do
  scenario "successfully" do
    create(:all_true_family)
    create(:all_false_family)

    visit families_path
    click_link("Active")

    expect(page).to have_content("true", count: 3)
    expect(page).not_to have_content("false")
  end
end
