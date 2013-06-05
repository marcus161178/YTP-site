class Video < ActiveRecord::Base
  attr_accessible :name, :url, :post_id
  
  belongs_to :post
  
  
end
