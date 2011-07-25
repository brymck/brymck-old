class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  helper_method :current_user
  helper_method :logged_in?
  helper_method :admin?

  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
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

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    if parsed_locale && I18n.available_locales.include?(parsed_locale.to_sym)
      parsed_locale
    else
      nil
    end
  end
end
