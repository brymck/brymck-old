require 'test_helper'

class PostsHelperTest < ActionView::TestCase
  setup do
    @post = posts(:multilingual)
  end

  test "should render English content by default" do
    assert_equal "English", render_content(@post)
  end

  test "should render Japanese content by request" do
    I18n.locale = :ja
    assert_equal "Japanese", render_content(@post)
  end
end
