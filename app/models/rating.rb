class Rating < ActiveRecord::Base
  belongs_to :neighborhood

  def percent
    denominator = Rating.where(year: year).sum(:value)
    value.to_f / denominator
  end

  def rank
    Rating.where("year = ? AND value > ?", year, value).count + 1
  end

  alias :ranking :rank
end

# == Schema Information
#
# Table name: ratings
#
#  id              :integer         not null, primary key
#  year            :integer         not null
#  value           :integer         not null
#  neighborhood_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

