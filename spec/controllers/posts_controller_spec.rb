require 'spec_helper'

describe PostsController do
  before(:each) do
    @post = Factory(:post)
  end

  describe "when not logged in" do
    it "should allow access to 'show'" do
      get :show, :id => @post.id
      response.should be_success
    end
    
    it "should deny access to 'new'" do
      get :new
      response.should redirect_to(login_path)
    end

    it "should deny access to 'journal'" do
      get :journal
      response.should redirect_to(friend_path)
    end

    it "should deny access to 'edit'" do
      get :edit, :id => @post.id
      response.should redirect_to(login_path)
    end

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(login_path)
    end

    it "should deny access to 'update'" do
      post :create
      response.should redirect_to(login_path)
    end

    it "should deny access to destroy" do
      delete :destroy, :id => @post.id
      response.should redirect_to(login_path)
    end
  end

  describe "when not logged in but considered a friend" do
    before(:each) do
      test_befriend
    end

    it "should allow access to 'journal'" do
      get :journal
      response.should be_success
    end
  end

  describe "when logged in" do
    before(:each) do
      test_login
    end

    it "should allow access to 'show'" do
      get :show, :id => @post.id
      response.should be_success
    end
    
    it "should deny access to 'new'" do
      get :new
      response.should redirect_to(login_path)
    end

    it "should deny access to 'journal'" do
      get :journal
      response.should redirect_to(friend_path)
    end

    it "should deny access to 'edit'" do
      get :edit, :id => @post.id
      response.should redirect_to(login_path)
    end

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(login_path)
    end

    it "should deny access to 'update'" do
      post :create
      response.should redirect_to(login_path)
    end

    it "should deny access to destroy" do
      delete :destroy, :id => @post.id
      response.should redirect_to(login_path)
    end
  end

  describe "when logged in as an administrator" do
    before(:each) do
      test_login_as_admin
    end

    it "should allow access to 'index'" do
      get :index
      response.should be_success
    end

    it "should allow access to 'new'" do
      get :new
      response.should be_success
    end

    it "should allow access to 'edit'" do
      get :edit, :id => @post.id
      response.should be_success
    end
  end
end
