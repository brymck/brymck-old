class PagesController < ApplicationController
  def root
    redirect_to home_path(preferred_locale)
  end

  def about
  end

  def signin
  end
end
