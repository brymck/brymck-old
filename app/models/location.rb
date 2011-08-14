class Location < ActiveRecord::Base
  has_many :business_hours, dependent: :destroy
  has_one :address, dependent: :destroy
  translates :name
  has_friendly_id :english_name, use_slug: true, allow_nil: true
  prevent_no_slug
  accepts_nested_attributes_for :business_hours, reject_if: lambda { |a| a[:opening].blank? }, allow_destroy: true

  def open?(time = Time.now)
    business_hours.each do |hours|
      return true if hours.open?(time)
    end
    false
  end

  def closed?(time = Time.now)
    !open?(time)
  end

  def combined_business_hours
    arr = []
    business_hours.each do |hours|
      hours.to_a.each_with_index do |day, index|
        arr[index] = day unless day.nil?
      end
    end
    arr
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
# Table name: locations
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  cached_slug :string(255)
#

