# coding: UTF-8

module ApplicationHelper
  def nav_item(label, path)
    if current_page?(path)
      content_tag :strong, t(label)
    else
      content_tag :li, link_to(t(label), path)
    end
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
