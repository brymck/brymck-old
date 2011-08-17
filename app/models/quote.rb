require 'net/http'
require 'uri'

class Quote < ActiveRecord::Base
  has_and_belongs_to_many :exchanges,  uniq: true
  has_and_belongs_to_many :portfolios, uniq: true
  translates :name
  validates_presence_of :name, :ticker
  has_friendly_id :ticker, use_slug: true, allow_nil: true
  prevent_no_slug

  PRICE_REGEX = '<div class="price">[^<]+<span class="amount">([0-9.,-]+)<\/span>'
  FIRST_BACKREF = 1

  def lookup
    url = URI.parse("http://www.bloomberg.com/")
    response = Net::HTTP.start(url.host, url.port) do |http|
      http.get "/apps/quote?ticker=#{ticker}"
    end
    match = response.body.match PRICE_REGEX
    if match.nil?
      "No match found."
    else
      match[FIRST_BACKREF]
    end
  end
end
