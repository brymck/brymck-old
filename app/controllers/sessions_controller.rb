class SessionsController < ApplicationController
  def new
    if params[:password]
      if Digest::MD5.hexdigest("#{ENV["SALT"]}#{params[:password]}") == ENV["BRYMCK_PASS"]
        session.merge! :admin => true, :friend => true
        redirect_to get_referer, :notice => t(:logged_in, get_locale_and_scope)
      end
    else
      session[:locale] = params[:locale]
      breadcrumbs.add t("meta.sessions.new.title"), login_path
    end
  end

  def friend
  end

  def verify_friend
    if %w{alban columbus sandy zelnick}.include?(params[:answer].to_s.downcase)
      session[:friend] = true
      redirect_to get_referer, :notice => t(:correct, :scope => [:sessions, :messages])
    else
      redirect_to friend_path, :alert => t(:incorrect, :scope => [:sessions, :messages])
    end
  end

  def destroy
    session.merge! :admin => false, :uid => nil
    redirect_to get_referer, :notice => t(:logged_out, get_locale_and_scope)
  end

  def failure
    redirect_to get_referer, :alert => t(:failure, get_locale_and_scope)
  end

  private

  def get_referer
    referer, session[:referer] = session[:referer], nil
    referer || request.referer || root_path
  end

  def get_locale_and_scope
    locale, session[:locale] = session[:locale], nil
    { :scope => :sessions, :locale => locale }
  end
end
