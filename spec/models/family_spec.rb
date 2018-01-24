require "rails_helper"

describe Family do
  describe "validations" do
    subject { Family.new(last_name: nil) }

    context "when creating a new family with no last_name is not valid" do
      it { should_not allow_value(nil).for(:last_name)}
    end

    context "when creating a new family with no capability is not valid" do
      it { should_not allow_value(nil).for(:capability)}
    end

    context "when creating a new family that is valid it is saved" do
      it { expect(build(:family)).to be_valid }
    end
  end
end
