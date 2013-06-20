class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :footer_variables
  
  def footer_variables
    @fbook_images = BlogImage.all
	@rposts = Post.where(:published => true).where("published_at <= ?", Time.now)
  @cats = Category.all
  
@subcats = @cats.shuffle

@subcats.each do |category|
  
if category.subcategories.size > 3 
  
  if @category1.blank?
    @category1 = category
  else if @category2.blank?
      @category2 = category
    else @category3.blank?
        @category3 = category
      end
    end
  
  

end
end

   
  end
end