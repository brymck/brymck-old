# coding: utf-8

require 'spec_helper'

describe Post do
  before(:each) do
    @post = Post.new :title => "Title", :content => "Content"
  end

  it "is valid with valid attributes" do
    @post.should be_valid
  end

  it "is not valid without a title" do
    @post.title = nil
    @post.should_not be_valid
  end

  it "is not valid without content" do
    @post.content = nil
    @post.should_not be_valid
  end
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  personal   :boolean         default(FALSE)
#

