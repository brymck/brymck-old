require 'spec_helper'

describe Post do
  before(:each) do
    @post = Factory(:post)
  end

  it "should give the author's name" do
    @post.author.should == @post.user.name
  end

end
