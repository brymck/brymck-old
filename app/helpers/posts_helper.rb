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
    comments.sort { |a, b| a.lft <=> b.lft }.each do |comment|
      html << render(:partial => "comments/comment", :locals => { :comment => comment, :indent => count_parents(comment) })
    end
    raw html
  end

  private

  def count_parents(comment, max = 4)
    (0..4).each do |count|
      if comment.parent.nil?
        return count
      else
        comment = comment.parent
      end
    end
    4
  end
end
