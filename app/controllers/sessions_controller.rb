class SessionsController < ApplicationController
  def new
    session[:referer] = request.referer
    session[:locale] = params[:locale]
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    session[:friend] = true
    redirect_to get_referer, :notice => t(:logged_in, get_locale_and_scope)
  end

  def friend
    session[:referer] = request.referer
  end

  def verify_friend
    if %w{alban columbus sandy zelnick}.include? params[:answer]
      session[:friend] = true
      redirect_to get_referer, :notice => t(:correct, :scope => [:sessions, :messages])
    else
      redirect_to friend_path, :alert => t(:incorrect, :scope => [:sessions, :messages])
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to get_referer, :notice => t(:logged_out, get_locale_and_scope)
  end

  def failure
    redirect_to get_referer, :alert => t(:failure, get_locale_and_scope)
  end

  private

  def get_referer
    referer, session[:referer] = session[:referer], nil
    referer.nil? ? root_path : referer
  end

  def get_locale_and_scope
    locale, session[:locale] = session[:locale], nil
    { :scope => :sessions, :locale => locale }
  end
end
