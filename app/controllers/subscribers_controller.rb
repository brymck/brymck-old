class SubscribersController < ApplicationController
  before_filter :authorize, except: [:new, :create]
  before_filter :add_breadcrumbs, only: [:index, :show, :new, :edit]

  def index
    @subscribers = Subscriber.find(:all)
  end

  def new
    @subscriber = Subscriber.new
    breadcrumbs.add t("meta.subscribers.new.title"), new_subscriber_path
  end

  def edit
    @subscriber = Subscriber.find(params[:id])
    breadcrumbs.add @subscriber.name, @subscriber
    breadcrumbs.add t("meta.subscribers.edit.title"), edit_subscriber_path(@subscriber)
  end

  def create
    @subscriber = Subscriber.new(params[:subscriber])

    if @subscriber.save
      redirect_to new_subscriber_path, notice: t("messages.subscribers.created")
    else
      render action: "new"
    end
  end

  def update
    @subscriber = Subscriber.find(params[:id])

    if @subscriber.update_attributes(params[:subscriber])
      redirect_to edit_subscriber_path(@subscriber), notice: t("messages.subscribers.updated")
    else
      render action: "edit"
    end
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy

    redirect_to subscribers_url
  end

  private

  def add_breadcrumbs
    breadcrumbs.add t(:subscribers, scope: [:layouts, :sidebar]), subscribers_path
  end
end
