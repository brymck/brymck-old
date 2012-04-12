# Create a custom renderer that allows highlighting of code blocks
class HTMLwithAlbino < Redcarpet::Render::HTML
  def block_code(code, language)
    Albino.colorize(code, language)
  end
end

RENDERER = Redcarpet::Markdown.new(HTMLwithAlbino,
                                   :no_intra_emphasis  => true,
                                   :tables             => true,
                                   :fenced_code_blocks => true,
                                   :autolink           => true,
                                   :superscript        => true)
