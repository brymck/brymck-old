class Neighborhood < ActiveRecord::Base
  # Relationships
  has_many :apartments
  has_many :ratings
  accepts_nested_attributes_for :ratings, reject_if: lambda { |r| r[:year].blank? }, allow_destroy: true

  # Validations
  validates_presence_of :name

  class << self
    def all_by_rating
      self.all.sort_by { |n| [-(n.rating || 0), n.name] }
    end
  end

  # Gems
  translates :name
  has_friendly_id :english_name, use_slug: true, allow_nil: true, approximate_ascii: true
  prevent_no_slug

  def percent(year)
    year_rating = ratings.where(year: year)
    if year_rating.empty?
      nil
    else
      year_rating.percent
    end
  end

  def sum_of_percents
    ratings.map(&:percent).inject(:+) || 0
  end

  def rating
    ratings.sum(:value)
  end

  def english_name
    translation = translations.find_by_locale("en")
    if translation.nil?
      name || attributes[:name]
    else
      translation.name
    end
  end
end

# == Schema Information
#
# Table name: neighborhoods
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  lat         :float
#  lng         :float
#  cached_slug :string(255)
#

