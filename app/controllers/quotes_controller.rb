class QuotesController < ApplicationController
  def show
    @quote = Quote.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render layout: false }
    end
  end
end
