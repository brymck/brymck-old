class TagsController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  before_filter :add_breadcrumbs, only: [:index, :show, :new, :edit]

  def index
    @tags = Tag.find(:all).sort { |a, b| b.count <=> a.count }
  end

  def show
    @tag = Tag.find(params[:id])
    breadcrumbs.add @tag.name.titlecase, tag_path(@tag) unless @tag.name.nil?
    @title = @tag.name
  end

  def new
    breadcrumbs.add t("meta.tags.new.title"), new_tag_path
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tag }
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    breadcrumbs.add @tag.name.titlecase, tag_path(@tag) unless @tag.name.nil?
    breadcrumbs.add t("meta.tags.edit.title"), edit_tag_path(@tag)
  end

  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.html { redirect_to(@tag, :notice => t("messages.tags.created")) }
        format.xml  { render :xml => @tag, :status => :created, :location => @tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(@tag, :notice => t("messages.tags.updated")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
      format.xml  { head :ok }
    end
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:tags, :scope => [:layouts, :sidebar]), tags_path
  end
end
