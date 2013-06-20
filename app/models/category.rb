class Category < ActiveRecord::Base
  attr_accessible :name, :url
  
  
  has_many :subcategorizations, :dependent => :destroy
  has_many :subcategories, :through => :subcategorizations, :dependent => :destroy
  
  has_many :categorizations, :through => :subcategorizations, :dependent => :destroy
  has_many :posts, :through => :categorizations
  
  
  extend FriendlyId
    friendly_id :name, use: :slugged
    
    
end
