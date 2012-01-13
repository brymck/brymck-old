class Source < ActiveRecord::Base
  extend FriendlyId

  # Relationships
  has_and_belongs_to_many :quotes, uniq: true
  has_many :metrics

  # Validations
  validates_presence_of :name, :url
  accepts_nested_attributes_for :metrics, reject_if: lambda { |m| m[:name].blank? }, allow_destroy: true

  # Gems
  translates :name
  friendly_id :name, use: :slugged
  prevent_no_slug
end



# == Schema Information
#
# Table name: sources
#
#  id          :integer         primary key
#  name        :string(255)     not null
#  cached_slug :string(255)
#  url         :string(255)     not null
#

