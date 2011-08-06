require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true

    def test_login_as_admin
      session.merge! 'admin' => true, 'friend' => true, 'uid' => 0
    end

    def test_login
      session.merge! 'uid' => 0
    end

    def test_logout
      session.merge! 'admin' => false, 'uid' => nil
    end

    def test_befriend
      session.merge! 'friend' => true
    end

    def test_defriend
      session.merge! 'friend' => false
    end

    def test_use_japanese
      I18n.locale = :ja
    end

    def test_use_english
      I18n.locale = :en
    end

    begin
      system "notify-send 'Spork' 'Loaded successfully!'"
    rescue
      puts "notify-send failed"
    end
  end
end

Spork.each_run do
  
end
