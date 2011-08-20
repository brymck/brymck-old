class Notify < ActionMailer::Base
  default to: ENV['EMAIL_ADDRESS']

  def login(auth, session, request)
    @auth, @session, @request = auth, session, request
    mail from: "no-reply@brymck.herokuapp.com"
  end

  def comment(comment)
    @comment = comment
    mail from: "no-reply@brymck.herokuapp.com"
  end

  def post(opts = {})
    @opts = opts
    mail to: @opts[:to], from: "listserv@brymck.herokuapp.com", subject: @opts[:title], reply_to: ENV['EMAIL_ADDRESS']
  end
end
