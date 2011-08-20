autoload :Sanitize, 'sanitize'

module PostsHelper
  def render_content(post, needs_sanitizing = false)
    html = RedCloth.new(post.content).to_html
    html = Sanitize.clean(html, Sanitize::Config::BASIC) if needs_sanitizing
    raw html
  end

  def convert_internal_links(text)
    text.gsub /href="\/(.*?)"/, %Q{href="http://brymck.heroku.com/$1"}
  end

  def notify_opts(post, subscriber)
    {
      content: RedCloth.new(post.content).to_html,
      post_link: post_url(post),
      unsubscribe_link: unsubscribe_url(subscriber, hash: subscriber.hash)
    }
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
