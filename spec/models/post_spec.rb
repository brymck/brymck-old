require 'spec_helper'

describe Post do
  before(:each) do
    @post = Factory(:post)
  end

  it "should give the author's name" do
    @post.author.should == @post.user.name
  end

end

# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  personal   :boolean         default(FALSE)
#

