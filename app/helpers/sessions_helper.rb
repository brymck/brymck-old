module SessionsHelper
  BUTTON_INDEXES = {
    :facebook    => 0,
    :twitter     => 1,
    :myspace     => 2,
    :hotmail     => 3,
    :yahoo       => 4,
    :google      => 5,
    :openid      => 6,
    :aol         => 7,
    :livejournal => 8,
    :flickr      => 11,
    :wordpress   => 14,
    :linkedin    => 16
  }
  Y_OFFSET = -50;

  def provider_button(name)
    offset = BUTTON_INDEXES[name] * Y_OFFSET
    link_to content_tag(:span, nil, { :class => "provider", :style => "background-position-y: #{offset}px" }), auth_path(:provider => name)
  end
end
