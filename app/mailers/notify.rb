class Notify < ActionMailer::Base
  default to: ENV['EMAIL_ADDRESS']

  def login(auth, session, request)
    @auth, @session, @request = auth, session, request
    mail from: "no-reply@brymck.heroku.com"
  end

  def comment(comment)
    @comment = comment
    mail from: "no-reply@brymck.heroku.com"
  end
end
