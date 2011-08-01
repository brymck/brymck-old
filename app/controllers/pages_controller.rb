class PagesController < ApplicationController
  def root
    redirect_to home_path(preferred_locale)
  end

  def resume
    breadcrumbs.add t("meta.pages.resume.title"), resume_path
  end
end
