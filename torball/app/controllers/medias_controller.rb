class MediasController < ApplicationController


  before_filter :login_required
  layout "backend"
  # GET /medias
  # GET /medias.xml
  def index
    @medias = Media.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medias }
    end
  end

  def uploadfile
      post = Media.upload_file(params[:upload], @current_user.id)
      flash[:success] = "Media savec successfully"
      redirect_to :action => 'index'
  end


  # GET /medias/1
  # GET /medias/1.xml
  def show
    @media = Media.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /medias/new
  # GET /medias/new.xml
  def new
    @media = Media.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @media }
    end
  end

  # GET /medias/1/edit
  def edit
    @media = Media.find(params[:id])
  end

  # POST /medias
  # POST /medias.xml
  def create
    respond_to do |format|
      if Media.save(params[:media])
        flash[:notice] = 'Media was successfully created.'
        redirect_to :action => 'index'
      else
         flash[:notice] = 'Media was NOT successfully created.'
      end
    end
  end

  # PUT /medias/1
  # PUT /medias/1.xml
  def update
    @media = Media.find(params[:id])

    respond_to do |format|
      if @media.update_attributes(params[:media])
        flash[:notice] = 'Media was successfully updated.'
        format.html { redirect_to(@media) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @media.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medias/1
  # DELETE /medias/1.xml
  def destroy
    @media = Media.find(params[:id])
    @media.destroy

    respond_to do |format|
      format.html { redirect_to(medias_url) }
      format.xml  { head :ok }
    end
  end
end
