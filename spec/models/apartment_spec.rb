require 'spec_helper'

describe Apartment do
  pending "add some examples to (or delete) #{__FILE__}"
end



# == Schema Information
#
# Table name: apartments
#
#  id                :integer         not null, primary key
#  zip               :integer
#  country           :string(255)     default("日本"), not null
#  prefecture        :string(255)     default("東京都"), not null
#  city              :string(255)
#  ward              :string(255)
#  town              :string(255)
#  district          :integer
#  block             :integer
#  house             :integer
#  neighborhood_id   :integer
#  created_at        :datetime
#  updated_at        :datetime
#  room_number       :integer
#  url               :string(255)
#  rent              :integer
#  key_money_months  :integer
#  rooms             :integer
#  living_room       :boolean
#  dining_room       :boolean
#  kitchen           :boolean
#  construction_date :date
#  memo              :text
#

