# coding: UTF-8
module ApplicationHelper
  FLASH_CLASSES = {
    :notice => :success,
    :alert  => :alert
  }

  def markdown(text, opts = {})
    return nil if text.nil?
    raw RENDERER.render(text)
  end
  
  def t_meta_interpolation(name, hash)
    instance_variable_set("@#{name}_interpolation", hash)
  end

  def t_meta(name)
    interpolation_data = instance_variable_get("@#{name}_interpolation") || {}
    t("meta.#{controller_path.gsub("/", ".")}.#{action_name}.#{name}",
      interpolation_data.merge({ :default => t("meta.defaults.#{name}") }))
  end

  def highlighted_title
    title = t(:brymck)
    html  = content_tag :span, title[0], class: :first
    html << title[1..-1]
    html.html_safe
  end

  def render_flash(flash)
    html = ""
    flash.each do |key, message|
      html << content_tag(:div, message, :class => FLASH_CLASSES[key])
    end
    raw html
  end

  def nav_item(label, path, opts = {})
    if current_page?(path)
      opts = { :"data-href" => path }.merge opts
      content_tag :li, content_tag(:span, label, opts)
    else
      content_tag :li, link_to(label, path, opts)
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
    
    # pubdate not allowed in time tag at this point.
    # #{opts[:pubdate] ? " pubdate" : ""}
    html  = %Q{<time datetime="#{computer_time}"#{opts[:pubdate] ? "" : ""}>#{human_time}</time>}
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
