class LocationsController < ApplicationController
  before_filter :authorize
  before_filter :add_breadcrumbs

  def index
    @locations = Location.find(:all)
  end

  def new
    @location = Location.new
    3.times { @location.business_hours.build }
    @location.build_address
    breadcrumbs.add t("meta.locations.new.title"), new_location_path
  end

  def edit
    @location = Location.find(params[:id])
    3.times { @location.business_hours.build }
    @location.build_address if @location.address.nil?
    breadcrumbs.add @location.name, location_path(@location)
    breadcrumbs.add t("meta.locations.edit.title"), edit_location_path(@location)
  end

  def show
    @location = Location.find(params[:id])
    @title = @location.name
    breadcrumbs.add @title, location_path(@location)
  end

  def create
    @location = Location.new(params[:location])

    if @location.save
      redirect_to @location, notice: t("messages.locations.created")
    else
      render action: "new"
    end
  end

  def update
    @location = Location.find(params[:id])

    if @location.update_attributes(params[:location].except(:tags))
      redirect_to @location, notice: t("messages.locations.updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_url
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:locations, :scope => [:layouts, :sidebar]), locations_path
  end
end
