class UsersController < ApplicationController
  before_filter :authorize

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blahs }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @blah = User.find(params[:id])
    @blah.destroy

    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, :notice => 'Blah was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  protected

  def authorize
    unless current_user.admin?
      flash[:notice] = "Log in please"
      redirect_to root_path
    end
  end
end
