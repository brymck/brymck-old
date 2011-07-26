# coding: UTF-8

module ApplicationHelper
  FLASH_CLASSES = {
    :notice => :success,
    :alert  => :alert
  }

  def render_flash(flash)
    html = ""
    flash.each do |key, message|
      html << content_tag(:div, message, :class => FLASH_CLASSES[key])
    end
    raw html
  end

  def nav_item(label, path)
    content_tag :li, link_to_unless_current(label, path)
  end

  def title
    base_title = t(:brymck)
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end

  def copyright_years
    base_year = 2010
    current_year = Time.now.year
    if current_year > base_year
      "#{base_year}‒#{current_year}"
    else
      base_year
    end
  end
end
