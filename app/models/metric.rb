class Metric < ActiveRecord::Base
  belongs_to :exchange
  translates :name
  validates_presence_of :name
end
