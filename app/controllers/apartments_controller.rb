class ApartmentsController < ApplicationController
  before_filter :authorize, only: :destroy
  before_filter :authorize_friends
  before_filter :add_breadcrumbs, only: [:index, :show, :new, :edit]

  def index
    @apartments = Apartment.find(:all)
  end

  def show
    @apartment = Apartment.find(params[:id])
    @title = @apartment.name
    breadcrumbs.add @title, apartment_path(@apartment)
    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end

  def new
    @apartment = Apartment.new
    breadcrumbs.add t("meta.apartments.new.title"), new_post_path
  end

  def edit
    @apartment = Apartment.find(params[:id])
    breadcrumbs.add @apartment.name, apartment_path(@apartment)
    breadcrumbs.add t("meta.apartments.edit.title"), edit_post_path(@apartment)
  end

  def create
    @apartment = Apartment.new(params[:apartment])

    if @apartment.save
      redirect_to @apartment, notice: t("messages.apartments.created")
    else
      render action: "new"
    end
  end

  def update
    @apartment = Apartment.find(params[:id])

    if @apartment.update_attributes(params[:apartment])
      redirect_to @apartment, notice: t("messages.apartments.updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    redirect_to apartments_url
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:apartments, scope: [:layouts, :sidebar]), apartments_path
  end
end
