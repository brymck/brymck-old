# coding: utf-8

require 'spec_helper'

describe PostsController do
  render_views

  before(:each) do
    test_use_english
    @post = Post.new title: 'Title', content: 'Content'
    @post.save
  end

  def valid_attributes
    { title: "Taitoru", content: "Kontentsu", tags: "" }
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

    # it "should allow access to 'journal'" do
    #   get :journal
    #   response.should be_success
    # end
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

    describe "POSTing a new post" do
      describe "with valid parameters" do
        it "creates a new Post'" do
          expect {
            post :create, post: valid_attributes
          }.to change(Post, :count).by(1)
        end

        it "assigns a newly created post as @post" do
          post :create, post: valid_attributes
          assigns(:post).should be_a(Post)
          assigns(:post).should be_persisted
        end

        it "redirects to the created post" do
          post :create, post: valid_attributes
          response.should redirect_to(Post.last)
        end
      end
    end

    describe "DELETEing a post" do
      it "destroys the requested post" do
        post = Post.create! valid_attributes.except :tags
        expect {
          delete :destroy, id: post.id.to_s
        }.to change(Post, :count).by(-1)
      end

      it "redirects to the testings list" do
        post = Post.create! valid_attributes.except :tags
        delete :destroy, id: post.id.to_s
        response.should redirect_to(posts_url)
      end
    end

  end

end
