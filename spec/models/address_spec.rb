# coding: utf-8
require 'spec_helper'

describe Address do
  before(:each) do
    @address = Address.new country: "USA", zip: 28202, state: "NC", city: "Charlotte", street: "301 S College St"
  end

  it "is valid with valid attributes" do
    @address.should be_valid
  end

  it "is not valid without a country" do
    @address.country = nil
    @address.should_not be_valid
  end

  it "is not valid without a state" do
    @address.state = nil
    @address.should_not be_valid
  end

  it "is not valid without a city" do
    @address.city = nil
    @address.should_not be_valid
  end

  it "is not valid without a street" do
    @address.street = nil
    @address.should_not be_valid
  end

  it "should convert correctly to a single-line string" do
    @address.to_s.should == "301 S College St, Charlotte, NC 28202, USA"
  end

  it "should convert correctly to a multi-line string" do
    @address.to_s(delim: "\n").should == "301 S College St\nCharlotte, NC 28202\nUSA"
  end
end

# == Schema Information
#
# Table name: addresses
#
#  id          :integer         not null, primary key
#  country     :string(255)
#  zip         :string(255)
#  state       :string(255)
#  city        :string(255)
#  street      :string(255)
#  extra       :string(255)
#  location_id :integer
#

