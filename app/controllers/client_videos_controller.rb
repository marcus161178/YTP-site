class ClientVideosController < ApplicationController
  # GET /client_videos
  # GET /client_videos.json
before_filter :authenticate_user!
  load_and_authorize_resource 
  
layout 'client_portal'

  def index
@client_videos = User.find(params[:id].to_i).client_videos.paginate(:page => params[:page], :per_page => 6)
     @user_id = params[:id].to_i
     @user = User.find(@user_id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_videos }
    end
  end

  # GET /client_videos/1
  # GET /client_videos/1.json
  def show
if current_user.id == ClientVideo.find(params[:id]).user.id    
@client_video = ClientVideo.find(params[:id])

   respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_video }
end
else
redirect_to client_portal_path
end
   
  end

  # GET /client_videos/new
  # GET /client_videos/new.json
  def new
    @client_video = ClientVideo.new
@user_id = params[:user_id].to_i
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_video }
    end
  end

  # GET /client_videos/1/edit
  def edit
    @client_video = ClientVideo.find(params[:id])
  end

  # POST /client_videos
  # POST /client_videos.json
  def create
    @client_video = ClientVideo.new(params[:client_video])

    respond_to do |format|
      if @client_video.save
        format.html { redirect_to client_videos_path(:id => @client_video.user.id ), notice: 'Client video was successfully created.' }
        format.json { render json: @client_video, status: :created, location: @client_video }
      else
        format.html { render action: "new" }
        format.json { render json: @client_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_videos/1
  # PUT /client_videos/1.json
  def update
    @client_video = ClientVideo.find(params[:id])

    respond_to do |format|
      if @client_video.update_attributes(params[:client_video])
        format.html { redirect_to @client_video, notice: 'Client video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_videos/1
  # DELETE /client_videos/1.json
  def destroy
    @client_video = ClientVideo.find(params[:id])
    @client_video.destroy

    respond_to do |format|
      format.html { redirect_to client_videos_path(:id => @client_video.user.id) }
      format.json { head :no_content }
    end
  end
end
