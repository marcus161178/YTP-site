class VendorImage < ActiveRecord::Base
  attr_accessible :name, :subcategory_id, :portfolio
 
  belongs_to :subcategory
  mount_uploader :portfolio, PortfolioUploader
    
  
end
