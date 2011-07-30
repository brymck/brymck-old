class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  helper_method :current_user
  helper_method :logged_in?
  helper_method :admin?
  helper_method :friend?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { :locale => I18n.locale }
  end

  protected

  def deny_access
    session[:referer] = request.fullpath
    redirect_to login_path, :alert => t(:deny_access)
  end

  def authorize
    deny_access unless admin?
  end

  def authorize_friends
    unless friend?
      session[:referer] = request.fullpath
      redirect_to friend_path
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user ? true : false
  end

  def admin?
    current_user ? @current_user.admin? : false
  end

  def friend?
    session[:friend] == true
  end

  def preferred_locale
    return [] if request.accept_language.nil?

    request.accept_language.split(",").each do |language|
      return language if I18n.available_locales.include?(language.to_sym)
    end

    I18n.default_locale.to_s
  end
end
