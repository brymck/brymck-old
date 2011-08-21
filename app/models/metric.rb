class Metric < ActiveRecord::Base
  belongs_to :source
  translates :name
  validates_presence_of :name
end



# == Schema Information
#
# Table name: metrics
#
#  id          :integer         primary key
#  name        :string(255)     not null
#  regex       :string(255)     not null
#  cached_slug :string(255)
#  source_id   :integer
#

