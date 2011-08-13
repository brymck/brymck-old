class Location < ActiveRecord::Base
  has_many :business_hours, dependent: :destroy
  has_one :address, dependent: :destroy
  translates :name
  has_friendly_id :english_name, use_slug: true, allow_nil: true
  prevent_no_slug
  accepts_nested_attributes_for :business_hours, reject_if: lambda { |a| a[:opening].blank? }, allow_destroy: true

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

