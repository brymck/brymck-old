class PageController < ApplicationController
  def home
    @title = t(:home)
  end

  def about
    @title = t(:about)
  end

end
