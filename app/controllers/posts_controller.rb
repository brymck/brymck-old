class PostsController < ApplicationController
  before_filter :authorize, except: [:feed, :home, :journal, :show]
  before_filter :authorize_friends, only: :journal

  def home
    @posts = Post.blog[0..2]

    respond_to do |format|
      format.html
      format.xml { render xml: @posts }
    end
  end

  def feed
    @posts = Post.blog
    render "feed.rss.haml", layout: false
  end

  def index
    @posts = Post.all
    breadcrumbs.add t("meta.posts.index.title"), posts_path
  end

  def journal
    @posts = Post.journal[0..2]
    breadcrumbs.add t("meta.posts.journal.title"), journal_path
  end

  def show
    @post = Post.find_by_slug(params[:id])
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
  end

  def edit
    @post = Post.find_by_slug(params[:id])
    breadcrumbs.add t("meta.posts.journal.title"), journal_path if @post.personal?
    breadcrumbs.add @post.title, post_path(@post)
    breadcrumbs.add t("meta.posts.edit.title"), edit_post_path(@post)
  end

  def create
    @post = Post.new(params[:post])

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
    @post = Post.find_by_slug(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, notice: t("messages.posts.updated")) }
        format.xml  { head :ok }
      else
        format.html { render action: "edit" }
        format.xml  { render xml: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    @post = Post.find_by_slug(params[:id])
    @post.publish!
    redirect_to posts_path
  end

  def destroy
    @post = Post.find_by_slug(params[:id])
    @post.destroy

    redirect_to posts_url
  end
end
