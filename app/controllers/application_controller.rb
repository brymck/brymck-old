class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale, :add_initial_breadcrumbs
  helper_method :admin?, :friend?, :logged_in?

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { :locale => I18n.locale }
  end

  protected

  def deny_access(message = :deny_access)
    session[:referer] = request.fullpath
    puts "Referer set to #{session[:referer]}"
    redirect_to login_path, :alert => t(message)
  end

  def authorize
    deny_access unless admin?
  end

  def authorize_friends
    unless friend?
      session[:referer] = (request.fullpath rescue nil)
      redirect_to friend_path
    end
  end

  def require_login
    deny_access(:request_details) unless logged_in?
  end

  private

  def add_initial_breadcrumbs
    breadcrumbs.add t(:home, :scope => [:layouts, :sidebar]), home_path
  end

  def logged_in?
    !session[:uid].nil?
  end

  def admin?
    logged_in? && session[:admin]
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
