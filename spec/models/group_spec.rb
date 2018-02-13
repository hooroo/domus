require "rails_helper"

describe Group do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:responsable_name) }
    it { is_expected.to validate_presence_of(:responsable_contact) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
  end

  context "when start_date is in the past" do
    it "is not valid" do
      group = build(:group, start_date: 1.month.ago)

      expect(group).not_to be_valid
    end
  end
end
