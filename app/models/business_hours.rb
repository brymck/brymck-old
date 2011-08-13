class BusinessHours < ActiveRecord::Base
  belongs_to :location
end

# == Schema Information
#
# Table name: business_hours
#
#  id          :integer         not null, primary key
#  day         :integer
#  opening     :string(255)
#  closing     :string(255)
#  time_zone   :string(255)
#  location_id :integer
#

