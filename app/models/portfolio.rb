class Portfolio < ActiveRecord::Base
  # Relationships
  has_and_belongs_to_many :quotes, uniq: true

  # Validations
  validates_presence_of :name
  accepts_nested_attributes_for :quotes, reject_if: lambda { |q| q[:name].blank? }, allow_destroy: true

  # Gems
  translates :name
  has_friendly_id :english_name, use_slug: true, allow_nil: true
  prevent_no_slug

  def lookup

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
