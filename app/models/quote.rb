require 'net/http'
require 'uri'

class Quote < ActiveRecord::Base
  # Relationships
  has_and_belongs_to_many :sources,    uniq: true
  has_and_belongs_to_many :portfolios, uniq: true

  # Validations
  validates_presence_of :name, :ticker

  # Gems
  translates :name
  has_friendly_id :ticker, use_slug: true, allow_nil: true
  prevent_no_slug

  PRICE_REGEX = '<div class="price">[^<]+<span class="amount">([0-9.,-]+)<\/span>'
  FIRST_BACKREF = 1

  def lookup
    uri = URI.parse sources.first.url.sub("%s", ticker)
    puts uri
    response = Net::HTTP.start(uri.host, uri.port) do |http|
      http.get uri.request_uri
    end
    match = response.body.match PRICE_REGEX
    if match.nil?
      "No match found."
    else
      match[FIRST_BACKREF]
    end
  end
end

# == Schema Information
#
# Table name: quotes
#
#  id          :integer         primary key
#  name        :string(255)     not null
#  ticker      :string(255)     not null
#  cached_slug :string(255)
#

