source 'http://rubygems.org'

gem 'rails'

gem 'awesome_nested_set'
gem 'breadcrumbs'
gem 'coderay'
gem 'friendly_id'
gem 'globalize3'
gem 'gravatar_image_tag'
gem 'haml'
gem 'jquery-rails'
gem 'omniauth'             # 1.2MB
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-linkedin'
gem 'omniauth-openid'
gem 'omniauth-twitter'
gem 'RedCloth'
gem 'rupee'
gem 'sanitize'             # 2.8MB

group :assets do           # 3.3MB
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'pg'
end

group :production, :development do
  # gem 'aws-s3'
  platforms :mswin, :mingw do 
    # gem 'eventmachine', git: "git://github.com/eventmachine/eventmachine"
  end
  gem 'thin'               # 4.8MB
end

group :development do
  gem 'annotate'
  gem 'rails-erd'
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
