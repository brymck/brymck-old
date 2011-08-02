# coding: utf-8

require 'spec_helper'

describe Post do
  before(:each) do
    @post = Factory(:multilingual_post)
  end

  it "should show the correct title in English by default" do
    @post.english_title.should == "Title"
  end

  it "should show the correct title in English when set" do
    test_use_english
    @post.local_title.should == "Title"
  end

  it "should show the correct title in Japanese when set" do
    test_use_japanese
    @post.local_title.should == "タイトル"
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

