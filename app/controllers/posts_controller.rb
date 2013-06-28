class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  
  load_and_authorize_resource 
  before_filter :authenticate_user!, :except => [:show, :index]
  
# before_filter :parse_raw_upload, :only => :add_files
  
  layout "bloglayout"
  
  def unpublished
    @posts = Post.where(:published => false).paginate(:page => params[:page], :per_page => 6)
    @blogimage = BlogImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
  def scheduled
    @posts = Post.where(:published => true).where("published_at > ?", Time.now).paginate(:page => params[:page], :per_page => 6)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  
  def index
    
    @page = params[:page].to_i
    if @page < 2 && params[:search].blank?
    @recentpost = Post.published.first
  end
    if params[:search].blank?
      @firstpublished = Post.published.first
      @posts = Post.fromsecond(@firstpublished).paginate(:page => params[:page], :per_page => 6)
    else
      @posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 6)
      @search_msg = "Sorry, No wedding results match #{params[:search]}" if @posts.blank?
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
    
  end

  

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @blog_images = @post.blog_images
    @videos = @post.videos
    @subcatz = @post.subcategorizations.sort_by{|s| s.category.name }
    # get prev
    @prev_post = Post.where(:published => true).where('published_at < ?', @post.published_at).first
    # get next
    @next_post = Post.where(:published => true).where('published_at > ?', @post.published_at).last
    
    if !@post.published? 
      if current_user.blank? || !current_user.admin?
        redirect_to weddings_path
      end
    else  
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end  
  
    
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @categories = Category.all
    @subcategories = Subcategory.all
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
    
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.create(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { respond_with_bip(@post) }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@post) }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def delete_image
    @post = Post.find(params[:id])
    @image = BlogImage.find(params[:image])
    @image.destroy
    
    
      respond_to do |format|
        format.html { redirect_to @post, notice: 'Files were successfully deleted.' }
        format.json { head :no_content }
    
      end
    end
    
    
  end
  

  
