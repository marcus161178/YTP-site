class SubcategoriesController < ApplicationController
  # GET /subcategories
  # GET /subcategories.json
  before_filter :authenticate_user!, :except => [:show]

  load_and_authorize_resource
  
  
  def index
    unless current_user.admin?
      redirect_to categories_path
    else
    @subcategories = Subcategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subcategories }
    end
    end
  end

  # GET /subcategories/1
  # GET /subcategories/1.json
  def show
    @subcategory = Subcategory.find(params[:id])
    @message = Message.new
    
    @posts = @subcategory.posts.where(:published => true).where("published_at <= ?", Time.now).paginate(:page => params[:page], :per_page => 6)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcategory }
    end
  end

  # GET /subcategories/new
  # GET /subcategories/new.json
  def new
    @subcategory = Subcategory.new
    @categories = Category.all
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcategory }
    end
  end

  # GET /subcategories/1/edit
  def edit
    @subcategory = Subcategory.find(params[:id])
    @category = Category.all
    @vendor_images = @subcategory.vendor_images
    
    
    
  end

  # POST /subcategories
  # POST /subcategories.json
  def create
    @subcategory = Subcategory.new(params[:subcategory])

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to @subcategory, notice: 'Subcategory was successfully created.' }
        format.json { render json: @subcategory, status: :created, location: @subcategory }
      else
        format.html { render action: "new" }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subcategories/1
  # PUT /subcategories/1.json
  def update
    @subcategory = Subcategory.find(params[:id])

    respond_to do |format|
      if @subcategory.update_attributes(params[:subcategory])
        format.html { redirect_to @subcategory, notice: 'Subcategory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.json
  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy

    respond_to do |format|
      format.html { redirect_to subcategories_url }
      format.json { head :no_content }
    end
  end
  
  
  
end
