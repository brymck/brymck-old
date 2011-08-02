class Notifier < ActionMailer::Base
  default :to => ENV['EMAIL_ADDRESS']

  def login
    @session, @ip = session, request.remote_ip
    mail :from => "no-reply@brymck.heroku.com"
  end
end
