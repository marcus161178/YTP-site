class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :footer_variables
  
  def footer_variables
    @fbook_images = BlogImage.all
	@rposts = Post.all
    @receptvenues = Category.find(7).children
    @ctry = Category.find(11).children
    @cmony = Category.find(21).children 
  end
    
end
