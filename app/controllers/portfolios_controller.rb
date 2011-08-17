class PortfoliosController < ApplicationController
  before_filter :authorize
  before_filter :add_breadcrumbs, only: [:index, :show, :new, :edit]

  def index
    @portfolios = Portfolio.find(:all)
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @title = @portfolio.name
    breadcrumbs.add @title, @portfolio
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.quotes.build }
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @portfolio.quotes.build
  end

  def create
    @portfolio = Portfolio.new(params[:portfolio])

    if @portfolio.save
      redirect_to @portfolio, notice: t("messages.portfolios.created")
    else
      render action: "new"
    end
  end

  def update
    @portfolio = Portfolio.find(params[:id])

    if @portfolio.update_attributes(params[:portfolio])
      redirect_to @portfolio, notice: t("messages.portfolios.updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    redirect_to portfolios_url
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:portfolios, scope: [:layouts, :sidebar]), portfolios_path
  end
end
