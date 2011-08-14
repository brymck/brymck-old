class LocationsController < ApplicationController
  before_filter :authorize
  before_filter :add_breadcrumbs

  def index
    @locations = Location.find(:all)
  end

  def new
    @location = Location.new
    3.times { @location.business_hours.build }
  end

  def edit
    @location = Location.find(params[:id])
    3.times { @location.business_hours.build }
  end

  def show
    @location = Location.find(params[:id])
  end

  def create
    @location = Location.new(params[:location])

    respond_to do |format|
      if @location.save
        redirect_to @location, notice: t("messages.locations.created")
      else
        render action: "new"
      end
    end
  end

  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location].except(:tags))
        redirect_to @location, notice: t("messages.locations.updated")
      else
        render action: "edit"
      end
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      redirect_to locations_url
    end
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:locations, :scope => [:layouts, :sidebar]), locations_path
  end
end
