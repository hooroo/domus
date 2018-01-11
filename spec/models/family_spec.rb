require 'rails_helper'

describe Family do
  it "is not valid without a last_name" do
    new_family = Family.new(last_name: nil)

    expect(new_family).to_not be_valid
  end

  it "is not valid without capability" do
    new_family = Family.new(capability: nil)

    expect(new_family).to_not be_valid
  end

  it "is valid without a first_name" do
    new_family = Family.new(
      first_name: nil,
      last_name: "Marta",
      capability: 2
    )

    expect(new_family).to be_valid
  end
end
