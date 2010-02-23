class MenusController < ApplicationController

  before_filter :login_required
  layout 'backend'

  # GET /menus
  # GET /menus.xml
  def index
    @menus = Menu.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menus }
    end
  end

  # GET /menus/1
  # GET /menus/1.xml
  def show
    @menu = Menu.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu }
    end
  end

  # GET /menus/new
  # GET /menus/new.xml
  def new
    return unless request.post?
    @menu = Menu.new(params[:menu])
    if @menu.save
      flash[:success_notice] = 'Menu was successfully created.'
      redirect_to :action => 'index'
    else
      flash[:fail_notice] = 'Menu was successfully created.'
      redirect_to :action => 'new'
    end
  end

  # GET /menus/1/edit
  def edit
    @menu = Menu.find(params[:id])
  end

  # POST /menus
  # POST /menus.xml
  def create
  end

  # PUT /menus/1
  # PUT /menus/1.xml
  def update
    @menu = Menu.find(params[:id])

    respond_to do |format|
      if @menu.update_attributes(params[:menu])
        flash[:notice] = 'Menu was successfully updated.'
        format.html { redirect_to(@menu) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menus/1
  # DELETE /menus/1.xml
  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to(menus_url) }
      format.xml  { head :ok }
    end
  end

  def add_link
    @menu = Menu.find_by_id(params[:id])
    @link = Link.new(:menu => @menu)
    
    return unless request.post?
      @link = Link.new(params[:link])
      @link.menu = @menu
      if @link.save
        flash[:success_notice] = "Link successfully created"
        redirect_to :action => 'show', :id => @menu.id
      else 
        flash[:fail_notice] = "Error during creation"
      end
  end
end
