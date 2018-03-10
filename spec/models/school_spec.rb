require "rails_helper"

describe School do
  describe "associations" do
    it { is_expected.to have_many(:trips) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:responsible_name) }
    it { is_expected.to validate_presence_of(:responsible_contact) }
  end

  context "when the responsible_contact is too short" do
    it "is not valid" do
      school = build(:school, responsible_contact: "123")

      expect(school).not_to be_valid
    end
  end
end
