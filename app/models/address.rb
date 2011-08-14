# coding: utf-8

class Address < ActiveRecord::Base
  belongs_to :location

  def to_s(opts = {})
    opts  = { delim: nil }.merge opts
    delim = opts[:delim] || ", "

    case country
    when "Japan", "日本"
      delim = "" if opts[:delim].nil?
      "#{"〒#{zip}#{delim}" unless zip.blank?}#{country}#{state}#{city}#{street}"
    else
      "#{street}#{delim}#{city}, #{state} #{zip}#{delim}#{country}"
    end
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

