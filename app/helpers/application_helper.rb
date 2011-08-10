# coding: UTF-8
require 'coderay'

module ApplicationHelper
  FLASH_CLASSES = {
    :notice => :success,
    :alert  => :alert
  }

  def textile(text, opts = {})
    safe = opts[:safe] || false
    html = RedCloth.new(text).to_html
    html = Sanitize.clean(html, Sanitize::Config::BASIC) unless opts[:safe]
    html.gsub!(/<pre( lang="(.+?)")?><code[^>]+>(.+?)<\/code><\/pre>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
    raw html
  end
  
  def t_meta_interpolation(name, hash)
    instance_variable_set("@#{name}_interpolation", hash)
  end

  def t_meta(name)
    interpolation_data = instance_variable_get("@#{name}_interpolation") || {}
    t("meta.#{controller_path.gsub("/", ".")}.#{action_name}.#{name}",
      interpolation_data.merge({ :default => t("meta.defaults.#{name}") }))
  end

  def render_flash(flash)
    html = ""
    flash.each do |key, message|
      html << content_tag(:div, message, :class => FLASH_CLASSES[key])
    end
    raw html
  end

  def nav_item(label, path, disable_pjax = nil)
    if current_page?(path)
      content_tag :li, content_tag(:span, label, :"data-href" => path, :"data-nopjax" => disable_pjax)
    else
      content_tag :li, link_to(label, path, :"data-nopjax" => disable_pjax)
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

  def time_tag(time, opts={})
    return "" if time.nil?

    opts.merge!(:pubdate => true, :show_distance_in_words => true)
    computer_time = l time, :format => "%FT%T"
    human_time = l time.in_time_zone(local_time_zone), :format => :long
    
    html  = %Q{<time datetime="#{computer_time}"#{opts[:pubdate] ? " pubdate" : ""}>#{human_time}</time>}
    if opts[:show_distance_in_words]
      time_in_words = t :ago, :scope => :time, :time => distance_of_time_in_words(time, Time.now)
      html << %Q{ (#{time_in_words})}
    end

    raw html
  end

  private

  def local_time_zone
    ActiveSupport::TimeZone.new(t(:zone, :scope => :time))
  end
end
