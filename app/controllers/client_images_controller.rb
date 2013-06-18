class ClientImagesController < ApplicationController
  # GET /client_images
  # GET /client_images.json
  
  load_and_authorize_resource
  
  def index
    @client_images = User.find(params[:id].to_i).client_images.page(params[:page]).per_page(60)
 @all_client_images = User.find(params[:id].to_i).client_images   
 @user_id = params[:id].to_i
     @user = User.find(@user_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_images }
    end
  end

  # GET /client_images/1
  # GET /client_images/1.json
  def show
    @client_image = ClientImage.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_image }
    end
  end

  # GET /client_images/new
  # GET /client_images/new.json
  def new
    @client_image = ClientImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_image }
    end
  end

  # GET /client_images/1/edit
  def edit
    @client_image = ClientImage.find(params[:id])
  end

  # POST /client_images
  # POST /client_images.json
  def create
    @client_image = ClientImage.create(params[:client_image])

#    respond_to do |format|
#      if @client_image.save
#        format.html { redirect_to @client_image, notice: 'Client image was successfully created.' }
#        format.json { render json: @client_image, status: :created, location: @client_image }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @client_image.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PUT /client_images/1
  # PUT /client_images/1.json
  def update
    @client_image = ClientImage.find(params[:id])
    @user_id = params[:id].to_i

    respond_to do |format|
      if @client_image.update_attributes(params[:client_image])
        format.html { redirect_to @client_image, notice: 'Client image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_images/1
  # DELETE /client_images/1.json
  def destroy
    @client_image = ClientImage.find(params[:id])
    @client_image.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index' , :id => @client_image.user_id }
      format.json { head :no_content }
    end
  end
  def destroy_multiple
    ClientImage.destroy(params[:client_images])
   @user_id = params[:user_id].to_i
    respond_to do |format|
    format.html { redirect_to :action => 'index', :id => @user_id }
    format.json { head :no_content }
  end
end

end
