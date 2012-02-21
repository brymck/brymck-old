class CommentsController < ApplicationController
  before_filter :authorize, :except => [:show, :create]
  before_filter :add_breadcrumbs, :only => [:index, :edit]

  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.find(:all).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    breadcrumbs.add t("meta.comments.edit.title"), edit_comment_path(@comment)
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if verify_recaptcha(:mode => @comment, :message => "Recaptcha error") && @comment.save
        Notify.comment(@comment).deliver
        format.html { redirect_to post_path(@comment.post, :anchor => "comment_#{@comment.id}"), :notice => t("messages.comments.created") }
        format.xml  { render :xml => @comment.post, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to post_path(@comment.post, :anchor => "comment_#{@comment.id}"), :notice => t("messages.comments.updated") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_path }
      format.xml  { head :ok }
    end
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t("meta.comments.index.title"), comments_path
  end
end
