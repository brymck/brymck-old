require 'oa-oauth'
require 'openid'
require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  # Providers with ID/secret (stored in local environment and Heroku config variables)
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
  provider :github,   ENV['GITHUB_ID'],   ENV['GITHUB_SECRET']
  provider :twitter,  ENV['TWITTER_ID'],  ENV['TWITTER_SECRET']
  
  # Dedicated OpenID
  provider :openid, nil, :name => 'aol',    :identifier => 'openid.aol.com'
  provider :openid, nil, :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
  provider :openid, nil, :name => 'yahoo',  :identifier => 'https://me.yahoo.com'
end
