require "rails_helper"

describe Family do
  describe "validations" do
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:capability) }
  end
end
