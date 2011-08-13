class Address < ActiveRecord::Base
  belongs_to :location
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

