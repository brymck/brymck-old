class PostsController < ApplicationController
  before_filter :authorize, except: [:feed, :home, :journal, :preview, :show]
  before_filter :authorize_friends, only: :journal

  def home
    @posts = Post.blog

    respond_to do |format|
      format.html
      format.xml { render xml: @posts }
    end
  end

  def feed
    @posts = Post.blog.find(:all, order: "id DESC", limit: 10)
    render layout: false
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.find(:all).reverse
    breadcrumbs.add t("meta.posts.index.title"), posts_path

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  def journal
    @posts = Post.journal
    breadcrumbs.add t("meta.posts.journal.title"), journal_path

    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
    end
  end

  def preview
    @post = Post.new params[:post]
    @post.created_at = Time.now

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @post }
    end
  end

  def show
    @post = Post.find(params[:id])
    if @post.personal?
      authorize_friends
      breadcrumbs.add t("meta.posts.journal.title"), journal_path
    end
    @title = @post.title
    breadcrumbs.add @title, post_path(@post)
  end

  def new
    @post = Post.new
    breadcrumbs.add t("meta.posts.new.title"), new_post_path

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
    breadcrumbs.add t("meta.posts.journal.title"), journal_path if @post.personal?
    breadcrumbs.add @post.title, post_path(@post)
    breadcrumbs.add t("meta.posts.edit.title"), edit_post_path(@post)
  end

  def create
    @post = Post.new(params[:post].except(:tags))
    parse_tags params[:post][:tags] { |tag| @post.tags << tag }

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, notice: t("messages.posts.created")) }
        format.xml  { render xml: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post].except(:tags))
        format.html { redirect_to(@post, notice: t("messages.posts.updated")) }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end
end
