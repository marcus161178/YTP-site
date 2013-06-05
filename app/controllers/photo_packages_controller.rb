class PhotoPackagesController < ApplicationController
  # GET /photo_packages
  # GET /photo_packages.json
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @photo_packages = PhotoPackage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photo_packages }
    end
  end

  # GET /photo_packages/1
  # GET /photo_packages/1.json
  def show
    @photo_package = PhotoPackage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo_package }
    end
  end

  # GET /photo_packages/new
  # GET /photo_packages/new.json
  def new
    @photo_package = PhotoPackage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo_package }
    end
  end

  # GET /photo_packages/1/edit
  def edit
    @photo_package = PhotoPackage.find(params[:id])
  end

  # POST /photo_packages
  # POST /photo_packages.json
  def create
    @photo_package = PhotoPackage.new(params[:photo_package])

    respond_to do |format|
      if @photo_package.save
        format.html { redirect_to @photo_package, notice: 'Photo package was successfully created.' }
        format.json { render json: @photo_package, status: :created, location: @photo_package }
      else
        format.html { render action: "new" }
        format.json { render json: @photo_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photo_packages/1
  # PUT /photo_packages/1.json
  def update
    @photo_package = PhotoPackage.find(params[:id])

    respond_to do |format|
      if @photo_package.update_attributes(params[:photo_package])
        format.html { redirect_to @photo_package, notice: 'Photo package was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_packages/1
  # DELETE /photo_packages/1.json
  def destroy
    @photo_package = PhotoPackage.find(params[:id])
    @photo_package.destroy

    respond_to do |format|
      format.html { redirect_to photo_packages_url }
      format.json { head :no_content }
    end
  end
end
