module ApplicationHelper
  def title
    base_title = t(:brymck)
    if @title.nil?
      base_title
    else
      "{#@title} | #{base_title}"
    end
  end

  def copyright_years

  end
end
