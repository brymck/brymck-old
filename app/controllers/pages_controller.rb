class PagesController < ApplicationController
  def root
    redirect_to home_path(preferred_locale)
  end

  def about
    breadcrumbs.add t("meta.pages.about.title"), about_path
  end
end
