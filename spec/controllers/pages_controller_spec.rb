# coding: utf-8

require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'resume' in English" do
    before(:each) do
      get :resume
    end

    it "should have the right title" do
      response.should have_selector("title", :content => "Résumé")
    end
  end

  describe "GET 'resume' in Japanese" do
    before(:each) do
      get :resume, :locale => :ja
    end

    it "should have the right title in Japanese" do
      response.should have_selector("title", :content => "レジメ")
    end
  end
end
