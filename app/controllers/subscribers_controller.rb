class SubscribersController < ApplicationController
  before_filter :authorize, except: [:new, :create, :unsubscribe]
  before_filter :add_breadcrumbs, only: [:index, :show, :edit]

  def environment
    Subscriber.env = params[:env]
    redirect_to subscribers_path
  end

  def activate
    @subscriber = Subscriber.find(params[:id])
    @subscriber.activate!
    redirect_to subscribers_path
  end

  def deactivate
    @subscriber = Subscriber.find(params[:id])
    @subscriber.deactivate!
    redirect_to subscribers_path
  end

  def approve
    @subscriber = Subscriber.find(params[:id])
    @subscriber.approve!
    redirect_to subscribers_path
  end

  def unsubscribe
    @subscriber = Subscriber.find(params[:id])
    if @subscriber.nil?
      redirect_to new_subscriber_path, alert: t("messages.subscribers.bad_id", id: params[:id])
    end
    if @subscriber.hash == params[:hash]
      @subscriber.unsubscribe!
      redirect_to new_subscriber_path, notice: t("messages.subscribers.unsubscribed", email: @subscriber.email)
    end
    redirect_to new_subscriber_path, alert: t("messages.subscribers.bad_hash", id: @subscriber.id)
  end

  def index
    @subscribers = Subscriber.find(:all)
  end

  def show
    @subscriber = Subscriber.find(params[:id])
    @title = @subscriber.name
    breadcrumbs.add @title, subscriber_path(@subscriber)
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
      redirect_to new_subscriber_path, notice: t("messages.subscribers.created", email: @subscriber.email)
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
