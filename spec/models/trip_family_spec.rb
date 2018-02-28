require "rails_helper"

RSpec.describe TripFamily do
  context "associations" do
    it { is_expected.to belong_to(:family) }
    it { is_expected.to belong_to(:trip) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:family) }
    it { is_expected.to validate_presence_of(:trip) }
  end
end
