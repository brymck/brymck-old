class Exchange < ActiveRecord::Base
  has_and_belongs_to_many :quotes, uniq: true
  has_many :metrics
  translates :name
  validates_presence_of :name, :abbr
  has_friendly_id :abbr
end
