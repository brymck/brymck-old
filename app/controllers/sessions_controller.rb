class SessionsController < ApplicationController
  def new
    session[:locale] = params[:locale]
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to request.referer, :notice => t(:logged_in, get_locale_and_scope)
  end

  def destroy
    session[:user_id] = nil
    redirect_to request.referer, :notice => t(:logged_out, get_locale_and_scope)
  end

  def failure
    redirect_to request.referer, :alert => t(:failure, get_locale_and_scope)
  end

  private

  def get_locale_and_scope
    locale = session[:locale]
    session[:locale] = nil
    { :scope => :sessions, :locale => locale }
  end
end
