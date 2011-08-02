class Notifier < ActionMailer::Base
  def login
    mail(:from => "no-reply@brymck.heroku.com", :to => ENV['EMAIL_ADDRESS'])
  end
end
