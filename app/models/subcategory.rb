class Subcategory < ActiveRecord::Base
  attr_accessible :name, :url, :slug, :category_ids
  
  has_many :subcategorizations, :dependent => :destroy
  has_many :categories, :through => :subcategorizations

  has_many :categorizations, :through => :subcategorizations, :dependent => :destroy
  has_many :posts, :through => :categorizations
 
  extend FriendlyId
    friendly_id :name, use: :slugged
  
  
  
end
