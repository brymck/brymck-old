# coding: utf-8

require 'spec_helper'

describe Comment do

  before(:each) do
    @post = Factory(:post)
    @attr = { :name => "Name", :content => "Comment" }
  end

  it "should create a new comment with valid attributes" do
    @post.comments.create!(@attr)
  end

  describe "post associations" do

    before(:each) do
      @comment = @post.comments.create(@attr)
    end

    it "should have a post attribute" do
      @comment.should respond_to(:post)
    end

    it "should have the right associated post" do
      @comment.post_id.should == @post.id
      @comment.post.should == @post
    end

  end

  describe "validations" do

    it "should have a post id" do
      Comment.new(@attr).should_not be_valid
    end

    it "should require a non-blank name" do
      @post.comments.build(@attr.merge(:name => "   ")).should_not be_valid
    end

    it "should require non-blank content" do
      @post.comments.build(@attr.merge(:content => "   ")).should_not be_valid
    end

  end

  describe "for monolingual comments" do

    before(:each) do
      @comment = Factory(:comment)
    end

    it "should show the correct name" do
      @comment.name.should == "Name"
    end

  end

  describe "for multilingual comments" do

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

