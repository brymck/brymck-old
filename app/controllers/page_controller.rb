class PageController < ApplicationController
  def root
    redirect_to home_path(preferred_locale)
  end

  def about
    @title = t(:about)
  end

  def signin
    @title = t(:signin)
  end
end
