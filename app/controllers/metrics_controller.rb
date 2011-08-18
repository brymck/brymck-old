class MetricsController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  before_filter :add_breadcrumbs, only: [:index, :show, :new, :edit]

  def index
    @metrics = Metric.find(:all)
  end

  def show
    @metric = Metric.find(params[:id])
    @title = @metric.name
    breadcrumbs.add @title, metric_path(@metric)
    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end

  def new
    @metric = Metric.new
    breadcrumbs.add t("meta.metrics.new.title"), new_post_path
  end

  def edit
    @metric = Metric.find(params[:id])
    breadcrumbs.add @metric.name, metric_path(@metric)
    breadcrumbs.add t("meta.metrics.edit.title"), edit_post_path(@metric)
  end

  def create
    @metric = Metric.new(params[:metric])

    if @metric.save
      redirect_to @metric, notice: t("messages.metrics.created")
    else
      render action: "new"
    end
  end

  def update
    @metric = Metric.find(params[:id])

    if @metric.update_attributes(params[:metric])
      redirect_to @metric, notice: t("messages.metrics.updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @metric = Metric.find(params[:id])
    @metric.destroy

    redirect_to metrics_url
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:market, scope: [:layouts, :sidebar]), market_path
    breadcrumbs.add t(:metrics, scope: [:layouts, :sidebar]), metrics_path
  end
end
