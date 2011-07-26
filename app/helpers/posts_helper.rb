module RedClothExtensions
  def en(opts)
    I18n.locale == :en ? opts[:text] : ""
  end

  def ja(opts)
    I18n.locale == :ja ? opts[:text] : ""
  end

  def img(opts)
    photo_id, size = opts[:text].split('|').map! { |str| str.strip }
    photo = flickr.photos.getInfo  :photo_id => photo_id
    sizes = flickr.photos.getSizes :photo_id => photo_id
    size ||= "Medium"
    match = sizes.find { |s| s.label == size }

    html  = %Q{<div class="flickr">}
    html << %Q{  <a href="#{FlickRaw.url_photopage photo}" target="_blank">}
    html << %Q{    <img src="#{match.source}" alt="#{photo.title}" title="#{photo.title}" width="#{match.width}" height="#{match.height}">}
    html << %Q{  </a>}
    html << %Q{  <p>#{photo.description}</p>}
    html << %Q{</div>}
  end
end

module PostsHelper
  def render_content(post)
    r = RedCloth.new post.content
    r.extend RedClothExtensions
    r.to_html
  end

  def pubdate(time)
    "<time pubdate datetime=\"#{l time, :format => :pubdate }\">#{l time, :format => :article }</time>"
  end
end
