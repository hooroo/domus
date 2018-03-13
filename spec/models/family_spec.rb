require "rails_helper"

describe Family do
  describe "validations" do
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:capability) }
  end

  describe "scope" do
    it "filter the families active" do
      active_family = create(:family, :active)

      expect(Family.active).to eq [active_family]
    end

    it "filter the inactive families" do
      inactive_family = create(:family, :inactive)

      expect(Family.inactive).to eq [inactive_family]
    end
  end
end
