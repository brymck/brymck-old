class SourcesController < ApplicationController
  before_filter :authorize
  before_filter :add_breadcrumbs, only: [:index, :show, :new, :edit]

  def index
    @sources = Source.find(:all)
  end

  def show
    @source = Source.find(params[:id])
    @title = @source.name
    breadcrumbs.add @title, @source
  end

  def new
    @source = Source.new
    @source.metrics.build
  end

  def edit
    @source = Source.find(params[:id])
    @source.metrics.build
  end

  def create
    @source = Source.new(params[:source])

    if @source.save
      redirect_to @source, notice: t("messages.sources.created")
    else
      render action: "new"
    end
  end

  def update
    @source = Source.find(params[:id])

    if @source.update_attributes(params[:source])
      redirect_to @source, notice: t("messages.sources.updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @source = Source.find(params[:id])
    @source.destroy

    redirect_to sources_url
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:sources, scope: [:layouts, :sidebar]), sources_path
  end
end

