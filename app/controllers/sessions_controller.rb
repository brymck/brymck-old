class SessionsController < ApplicationController
  def new
    session[:referer] = request.referer
    session[:locale] = params[:locale]
    breadcrumbs.add t("meta.sessions.new.title"), login_path
  end

  def create
    auth = request.env["omniauth.auth"]
    session.merge!(
      'email'    => (auth['extra']['user_hash']['email'] rescue ''),
      'name'     => (auth['extra']['user_hash']['name'] rescue ''),
      'provider' => auth["provider"],
      'uid'      => auth["uid"]
    )
    determine_admin_status
    # Notifier.welcome.deliver
    puts "#{session[:name]} logged in as #{session[:admin] ? "an administrator" : "a regular user"} using #{session[:provider].titlecase} from #{request.remote_ip}"
    redirect_to get_referer, :notice => t(:logged_in, get_locale_and_scope)
  end

  def friend
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
    session.merge!('admin' => false, 'uid' => nil)
    redirect_to get_referer, :notice => t(:logged_out, get_locale_and_scope)
  end

  def failure
    redirect_to get_referer, :alert => t(:failure, get_locale_and_scope)
  end

  private

  def determine_admin_status
    if (case session[:provider]
        when 'facebook'
          session[:uid] == '2724737'
        when 'google'
          session[:uid] == 'https://www.google.com/accounts/o8/id?id=AItOawkjEi8xQ_3R_kE5BZzAqS82QTo9SKqaJsE'
        when 'twitter'
          session[:uid] == '32799321'
        else
          false
       end)
      session.merge! 'admin' => true, 'friend' => true
    else
      session['admin'] = false
    end
  end

  def get_referer
    referer, session[:referer] = session[:referer], nil
    referer || request.referer || root_path
  end

  def get_locale_and_scope
    locale, session[:locale] = session[:locale], nil
    { :scope => :sessions, :locale => locale }
  end
end
