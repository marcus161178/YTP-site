class BlogImagesController < ApplicationController
  # GET /blog_images
  # GET /blog_images.json
  
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  
  def index
    @blog_images = Post.find(params[:id].to_i).blog_images
    @post_id = params[:id].to_i
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @blog_images }
    end
  end

  # GET /blog_images/1
  # GET /blog_images/1.json
  def show
    @blog_image = BlogImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @blog_image }
    end
  end

  # GET /blog_images/new
  # GET /blog_images/new.json
  def new
    @blog_image = BlogImage.new(:post_id => params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @blog_image }
    end
  end

  # GET /blog_images/1/edit
  def edit
    @blog_image = BlogImage.find(params[:id])
  end

  # POST /blog_images
  # POST /blog_images.json
  def create
    @blog_image = BlogImage.create(params[:blog_image])
#    @post = @blog_image.post

 #     respond_to do |format|
#      if @blog_image.save
 #      format.html { redirect_to @post, notice: 'Blog image was successfully created.' }
  #      format.json { render json: @blog_image, status: :created, location: @blog_image }
  #    else
  #      format.html { render action: "new" }
  #      format.json { render json: @blog_image.errors, status: :unprocessable_entity }
  #    end
  #  end
  end

  # PUT /blog_images/1
  # PUT /blog_images/1.json
  def update
    @blog_image = BlogImage.find(params[:id])

    respond_to do |format|
      if @blog_image.update_attributes(params[:blog_image])
        format.html { redirect_to @blog_image, notice: 'Blog image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @blog_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blog_images/1
  # DELETE /blog_images/1.json
  def destroy
    @blog_image = BlogImage.find(params[:id])
    @blog_image.destroy

    respond_to do |format|
      format.html { redirect_to blog_images_url }
      format.json { head :no_content }
    end
  end
end
