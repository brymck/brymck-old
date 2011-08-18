class QuotesController < ApplicationController
  before_filter :authorize, except: [:index, :show]
  before_filter :add_breadcrumbs, only: [:index, :show, :new, :edit]

  def index
    @quotes = Quote.find(:all)
  end

  def show
    @quote = Quote.find(params[:id])
    @title = @quote.name
    breadcrumbs.add @title, quote_path(@quote)
    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end

  def new
    @quote = Quote.new
    breadcrumbs.add t("meta.quotes.new.title"), new_post_path
  end

  def edit
    @quote = Quote.find(params[:id])
    breadcrumbs.add @quote.name, quote_path(@quote)
    breadcrumbs.add t("meta.quotes.edit.title"), edit_post_path(@quote)
  end

  def create
    @quote = Quote.new(params[:quote])

    if @quote.save
      redirect_to @quote, notice: t("messages.quotes.created")
    else
      render action: "new"
    end
  end

  def update
    @quote = Quote.find(params[:id])

    if @quote.update_attributes(params[:quote])
      redirect_to @quote, notice: t("messages.quotes.updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    redirect_to quotes_url
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:market, scope: [:layouts, :sidebar]), market_path
    breadcrumbs.add t(:quotes, scope: [:layouts, :sidebar]), quotes_path
  end
end
