module PostsHelper
  def flickr_img(photo_id, size = "Medium")
    photo = flickr.photos.getInfo(:photo_id => photo_id)
    sizes = flickr.photos.getSizes :photo_id => photo_id
    match = sizes.find { |s| s.label == size }

    raw %Q{<div class="flickr">
             <a href="#{FlickRaw.url_photopage photo}" target="_blank">
               <img src="#{match.source}" alt="#{photo.title}" title="#{photo.title}" width="#{match.width}" height="#{match.height}">
             </a>
             <p>#{photo.description}</p>
           </div>}
  end

  def pubdate(time)
    "<time pubdate datetime=\"#{l time, :format => :pubdate }\">#{l time, :format => :article }</time>"
  end
end
