class VendorImagesController < ApplicationController
  # GET /vendor_images
  # GET /vendor_images.json
  def index
    @vendor_images = VendorImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendor_images }
    end
  end

  # GET /vendor_images/1
  # GET /vendor_images/1.json
  def show
    @vendor_image = VendorImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendor_image }
    end
  end

  # GET /vendor_images/new
  # GET /vendor_images/new.json
  def new
    @vendor_image = VendorImage.new(:subcategory_id => params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vendor_image }
    end
  end

  # GET /vendor_images/1/edit
  def edit
    @vendor_image = VendorImage.find(params[:id])
  end

  # POST /vendor_images
  # POST /vendor_images.json
  def create
    @vendor_image = VendorImage.create(params[:vendor_image])

    
  end

  # PUT /vendor_images/1
  # PUT /vendor_images/1.json
  def update
    @vendor_image = VendorImage.find(params[:id])

    respond_to do |format|
      if @vendor_image.update_attributes(params[:vendor_image])
        format.html { redirect_to @vendor_image, notice: 'Vendor image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendor_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendor_images/1
  # DELETE /vendor_images/1.json
  def destroy
    @vendor_image = VendorImage.find(params[:id])
    @vendor_image.destroy

    respond_to do |format|
      format.html { redirect_to subcategory_url(@vendor_image.subcategory) }
      format.json { head :no_content }
    end
  end
end
