class CodeController < ApplicationController
  # GET /code
  # GET /code.xml
  def index
    @code = Code.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @code }
    end
  end

  # GET /code/1
  # GET /code/1.xml
  def show
    @code = Code.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @code }
    end
  end

  # GET /code/new
  # GET /code/new.xml
  def new
    @code = Code.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @code }
    end
  end

  # GET /code/1/edit
  def edit
    @code = Code.find(params[:id])
  end

  # POST /code
  # POST /code.xml
  def create
    @code = Code.new(params[:code])

    respond_to do |format|
      if @code.save
        format.html { redirect_to(@code, :notice => 'Code was successfully created.') }
        format.xml  { render :xml => @code, :status => :created, :location => @code }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /code/1
  # PUT /code/1.xml
  def update
    @code = Code.find(params[:id])

    respond_to do |format|
      if @code.update_attributes(params[:code])
        format.html { redirect_to(@code, :notice => 'Code was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @code.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /code/1
  # DELETE /code/1.xml
  def destroy
    @code = Code.find(params[:id])
    @code.destroy

    respond_to do |format|
      format.html { redirect_to(code_url) }
      format.xml  { head :ok }
    end
  end
end
