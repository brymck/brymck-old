module RedClothExtensions
  def en(opts)
    I18n.locale == :en ? opts[:text] : ""
  end

  def ja(opts)
    I18n.locale == :ja ? opts[:text] : ""
  end
end

module PostsHelper
  def render_content(post)
    r = RedCloth.new post.content
    r.extend RedClothExtensions
    raw r.to_html
  end

  def render_comments(comments)
    html = ""
    comments.each do |comment|
      html << render(:partial => "comments/comment", :locals => { :comment => comment })
    end
    raw html
  end
end
