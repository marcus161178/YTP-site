class CustomController < ApplicationController
  
  
    layout "homelayout"
    
  def home
    @blog_images = BlogImage.all
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @images }
    end
  end


  

end
