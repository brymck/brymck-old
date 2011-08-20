class PagesController < ApplicationController
  before_filter :require_login, :only => [:contact, :resume]

  def root
    redirect_to home_path(preferred_locale)
  end

  def contact
    breadcrumbs.add t("meta.pages.contact.title"), contact_path
  end

  def resume
    breadcrumbs.add t("meta.pages.resume.title"), resume_path
  end

  def sitemap
    @entries = []
    render "sitemap.xml.haml", layout: false
  end
end
