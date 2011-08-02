require 'oa-oauth'
require 'openid'
require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  # Providers with ID/secret (stored in local environment and Heroku config variables)
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
  provider :github,   ENV['GITHUB_ID'],   ENV['GITHUB_SECRET']
  provider :linkedin, ENV['LINKEDIN_ID'], ENV['LINKEDIN_SECRET']
  provider :twitter,  ENV['TWITTER_ID'],  ENV['TWITTER_SECRET']
  
  # Dedicated OpenID
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'aol',    :identifier => 'https://openid.aol.com'
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'yahoo',  :identifier => 'https://me.yahoo.com'
end
