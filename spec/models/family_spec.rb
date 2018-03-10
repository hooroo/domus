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
end
