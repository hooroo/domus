require "rails_helper"

describe Family do
  context "validations" do
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:capability) }
  end

  describe ".by_last_name" do
    it "orders by last name" do
      family1 = create(:family, last_name: "zoo")
      family2 = create(:family, last_name: "alba")
      family3 = create(:family, last_name: "rossi")

      expect(Family.by_last_name).to eq [family2, family3, family1]
    end
  end

  describe ".active" do
    it "filters the active families" do
      active_family = create(:family, :active)
      create(:family, :inactive)

      expect(Family.active).to eq [active_family]
    end
  end

  describe ".inactive" do
    it "filters the inactive families" do
      inactive_family = create(:family, :inactive)
      create(:family, :active)

      expect(Family.inactive).to eq [inactive_family]
    end
  end
end
