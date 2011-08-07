source 'http://rubygems.org'

gem 'rails', '~> 3.1.0.rc'

gem 'awesome_nested_set'
gem 'breadcrumbs'
gem 'friendly_id'
gem 'globalize3'
gem 'gravatar_image_tag'
gem 'jquery-rails'
gem 'omniauth', '>= 0.1.6'
gem 'RedCloth'
gem 'sanitize'
gem 'thin'

group :assets do
  gem 'sass-rails', '~> 3.1.0.rc'
  gem 'coffee-rails', '~> 3.1.0.rc'
  gem 'uglifier'
end

group :production do
  gem 'pg'
end

group :production, :development do
  gem 'aws-s3'
end

group :development do
  gem 'annotate'
  gem 'rails-erd'
end

group :development, :test do
  gem 'execjs'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'therubyracer'
end

group :test do
  gem 'autotest'
  gem 'rspec'
  gem 'spork'
  gem 'test_notifier'
  gem 'webrat'
end
