class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.json
  before_filter :authenticate_user!
  load_and_authorize_resource 
  
  layout "client_portal"
  
  def index 
    if current_user.admin == true   
    @gallery = Gallery.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  else
    redirect_to client_portal_path
  end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])
    @images = current_user.client_images.where(:gallery_id => @gallery.id).paginate(:page => params[:page], :per_page => 60)
    
    if @images.blank?
      redirect_to client_portal_path
    #else
    #@imagesforcount = current_user.client_images.where(:gallery_id => @gallery.id)
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
    
  end
  end

  # GET /galleries/new
  # GET /galleries/new.json
  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /galleries/1
  # PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end
end
