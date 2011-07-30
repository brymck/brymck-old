require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  content    :text
#  post_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  parent_id  :integer
#  lft        :integer
#  rgt        :integer
#

