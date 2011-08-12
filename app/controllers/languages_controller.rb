class LanguagesController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  before_filter :add_breadcrumbs, :only => [:index, :show, :new, :edit]

  def index
    @languages = Language.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @language }
    end
  end

  def show
    @language = Language.find(params[:id])
    @title = @language.name
    breadcrumbs.add @title, language_path(@language)
  end

  def new
    breadcrumbs.add t("meta.languages.new.title"), new_language_path
    @language = Language.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @language }
    end
  end

  def edit
    @language = Language.find(params[:id])
    breadcrumbs.add @language.name, language_path(@language)
    breadcrumbs.add t("meta.languages.edit.title"), edit_language_path(@language)
  end

  def create
    @language = Language.new(params[:language])

    respond_to do |format|
      if @language.save
        format.html { redirect_to(@language, :notice => t("messages.languages.created")) }
        format.xml  { render :xml => @language, :status => :created, :location => @language }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @language.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    params[:language][:code_ids] ||= []
    @language = Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to(@language, :notice => t("messages.languages.updated")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @language.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.html { redirect_to(languages_path) }
      format.xml  { head :ok }
    end
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:code, :scope => [:layouts, :sidebar]), code_index_path
    breadcrumbs.add t(:languages, :scope => [:layouts, :sidebar]), languages_path
  end
end
