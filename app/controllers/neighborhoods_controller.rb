class NeighborhoodsController < ApplicationController
  before_filter :authorize, only: :destroy
  before_filter :authorize_friends
  before_filter :add_breadcrumbs, only: [:index, :show, :new, :edit]

  def index
    @neighborhoods = Neighborhood.all_by_rating
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @title = @neighborhood.name
    breadcrumbs.add @title, neighborhood_path(@neighborhood)
  end

  def new
    @neighborhood = Neighborhood.new
    @neighborhood.ratings.build
    breadcrumbs.add t("meta.neighborhoods.new.title"), new_post_path
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.ratings.build
    breadcrumbs.add @neighborhood.name, neighborhood_path(@neighborhood)
    breadcrumbs.add t("meta.neighborhoods.edit.title"), edit_post_path(@neighborhood)
  end

  def create
    @neighborhood = Neighborhood.new(params[:neighborhood])

    if @neighborhood.save
      redirect_to @neighborhood, notice: t("messages.neighborhoods.created")
    else
      render action: "new"
    end
  end

  def update
    @neighborhood = Neighborhood.find(params[:id])

    if @neighborhood.update_attributes(params[:neighborhood])
      redirect_to @neighborhood, notice: t("messages.neighborhoods.updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.destroy

    redirect_to neighborhoods_url
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:neighborhoods, scope: [:layouts, :sidebar]), neighborhoods_path
  end
end
