# coding: utf-8

require 'spec_helper'

describe Comment do
  before(:each) do
    @comment = Factory(:multilingual_comment)
  end

  it "should show the correct name in English by default" do
    @comment.local_name.should == "Name"
  end

  it "should show the correct name in English when set" do
    test_use_english
    @comment.local_name.should == "Name"
  end

  it "should show the correct name in Japanese when set" do
    test_use_japanese
    @comment.local_name.should == "名前"
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

