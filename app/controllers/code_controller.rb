class CodeController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  before_filter :add_breadcrumbs, :only => [:index, :show, :new, :edit]

  def index
    @code = Code.find(:all, :limit => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @code }
    end
  end

  def show
    @code = Code.find(params[:id])
    @title = @code.local_title
    breadcrumbs.add @title, code_path(@code)
  end

  def new
    breadcrumbs.add t("meta.code.new.title"), new_code_path
    @code = Code.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @code }
    end
  end

  def edit
    @code = Code.find(params[:id])
    breadcrumbs.add @code.local_title, code_path(@code)
    breadcrumbs.add t("meta.code.edit.title"), edit_code_path(@code)
  end

  def create
    @code = Code.new(params[:code])

    respond_to do |format|
      if @code.save
        format.html { redirect_to(@code, :notice => t("messages.code.created")) }
        format.xml  { render :xml => @code, :status => :created, :location => @code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    params[:code][:language_ids] ||= []
    @code = Code.find(params[:id])

    respond_to do |format|
      if @code.update_attributes(params[:code])
        format.html { redirect_to(@code, :notice => t("messages.code.updated")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @code = Code.find(params[:id])
    @code.destroy

    respond_to do |format|
      format.html { redirect_to(code_index_path) }
      format.xml  { head :ok }
    end
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:code, :scope => [:layouts, :sidebar]), code_index_path
  end
end
