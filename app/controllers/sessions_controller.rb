class SessionsController < ApplicationController
  def new
    @title = t(:signin)
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to request.referer, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to request.referer, :notice => "Signed out!"
  end

  def failure
    redirect_to request.referer, :alert => "Authentication failure!"
  end
end
