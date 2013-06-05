class Category < ActiveRecord::Base
  attr_accessible :name, :post_id, :url, :ancestry
  
  has_ancestry
  
  has_many :categorizations
  has_many :posts, :through => :categorizations
  extend FriendlyId
    friendly_id :name, use: :slugged
    
    
end
