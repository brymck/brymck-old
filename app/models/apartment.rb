# coding: utf-8

class Apartment < ActiveRecord::Base
  belongs_to :neighborhood

  def address(format = :default)
    text = ""
    case format
    when :long
      text << "〒#{zip}<br>" unless zip.nil?
      text << "#{country}#{prefecture}#{city}#{ward}#{town}#{district}"
    when :short
      text << "#{town}#{district}"
    else # :default
      text << "#{prefecture}#{city}#{ward}#{town}#{district}"
    end
    text << "-#{block}"       unless block.nil?
    text << "-#{house}"       unless house.nil?
    text << "-#{room_number}" unless room_number.nil?
    text.html_safe
  end

  def layout
    text  = rooms.to_s
    text << "L" if living_room?
    text << "D" if dining_room?
    text << "K" if kitchen?
    text << "R" if text == rooms.to_s
    text
  end
  
  def name
    "##{id} (#{address :short})"
  end
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

