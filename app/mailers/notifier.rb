class Notifier < ActionMailer::Base
  default :to => ENV['EMAIL_ADDRESS']

  def login
    mail :from => "no-reply@brymck.heroku.com"
    raise session.to_yaml
  end
end
