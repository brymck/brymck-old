source 'http://rubygems.org'

gem 'rails', '~> 3.1.0.rc'

gem 'awesome_nested_set'
gem 'breadcrumbs'
gem 'coderay'
gem 'friendly_id'
gem 'globalize3'
gem 'gravatar_image_tag'
gem 'haml'
gem 'jquery-rails'
gem 'omniauth', '>= 0.1.6' # 1.2MB
gem 'RedCloth'
gem 'sanitize'             # 2.8MB
gem 'uglifier'

group :assets do           # 3.3MB
  gem 'sass-rails', '~> 3.1.0.rc'
  gem 'coffee-rails', '~> 3.1.0.rc'
  gem 'uglifier'
end

group :production do
  gem 'pg'
end

group :production, :development do
  gem 'aws-s3'
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
  gem 'execjs'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'therubyracer', platforms: :ruby
end

group :test do
  gem 'autotest'
  gem 'rspec'
  gem 'spork'
  gem 'test_notifier'
  gem 'webrat'
end
