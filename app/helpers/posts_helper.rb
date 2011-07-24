module PostsHelper
  def safe_textilize
    RedCloth.new( sanitize( @post.content ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
  end
end
