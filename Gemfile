source 'http://rubygems.org'

gem 'rails', '~> 3.2.13'

gem 'awesome_nested_set'
gem 'breadcrumbs'
gem 'coderay'
gem 'gravatar_image_tag'
gem 'haml'
gem 'jquery-rails'
gem "recaptcha", :require => "recaptcha/rails"
gem 'redcarpet'
gem 'sanitize'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'pg'
end

group :production, :development do
  gem 'thin'
end

group :development do
  gem 'annotate'
  gem 'heroku'
  gem 'rails-erd'
  gem 'taps'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :test do
  gem 'autotest'
  gem 'rspec'
  gem 'spork'
  gem 'test_notifier'
  gem 'webrat'
end
