class Apartment < ActiveRecord::Base
  belongs_to :neighborhood
end

# == Schema Information
#
# Table name: apartments
#
#  id              :integer         not null, primary key
#  zip             :integer
#  country         :string(255)     default("日本"), not null
#  prefecture      :string(255)     default("東京都"), not null
#  city            :string(255)
#  ward            :string(255)
#  town            :string(255)
#  district        :integer
#  block           :integer
#  house           :integer
#  neighborhood_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

