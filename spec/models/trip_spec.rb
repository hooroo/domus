require "rails_helper"

describe Trip do
  describe "associations" do
    it { is_expected.to belong_to(:group) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:total_girls) }
    it { is_expected.to validate_presence_of(:total_boys) }
    it { is_expected.to validate_presence_of(:total_teachers) }
    it { is_expected.to validate_presence_of(:total_bus_drivers) }
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
  end

  describe "delegators" do
    it { is_expected.to delegate_method(:name).to(:group).with_prefix }
  end

  context "when start_date is in the past" do
    it "is return the correct error" do
      error_message = I18n.t(
        "activerecord.errors.models.trip.start_date_in_the_past",
      )
      trip = build(:trip, start_date: 1.month.ago)
      trip.valid?

      expect(trip.errors[:start_date]).to eq [error_message]
    end
  end

  context "when start_date is after end_date" do
    it "is return the correct error" do
      error_message = I18n.t(
        "activerecord.errors.models.trip.start_date_after_end_date",
      )
      trip = build(:trip, start_date: 1.month.from_now, end_date: 2.month.ago)
      trip.valid?

      expect(trip.errors[:base]).to eq [error_message]
    end
  end
end
