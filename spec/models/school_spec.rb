require "rails_helper"

describe School do
  describe "associations" do
    it { is_expected.to have_many(:trips) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:responsable_name) }
    it { is_expected.to validate_presence_of(:responsable_contact) }
  end

  context "when the responsable_contact is too short" do
    it "is not valid" do
      school = build(:school, responsable_contact: "123")

      expect(school).not_to be_valid
    end
  end
end
