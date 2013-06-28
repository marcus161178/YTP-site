class Subcategory < ActiveRecord::Base
  attr_accessible :name, :url, :slug, :category_ids, :vendor_images_attributes, :description, :phone_number, :email, :website
  
  
  has_many :vendor_images, :dependent => :destroy
  
  accepts_nested_attributes_for :vendor_images, :allow_destroy => true
  
  
  
    
  has_many :subcategorizations, :dependent => :destroy
  has_many :categories, :through => :subcategorizations

  has_many :categorizations, :through => :subcategorizations, :dependent => :destroy
  has_many :posts, :through => :categorizations
 
  
  
  extend FriendlyId
    friendly_id :name, use: :slugged
  
  default_scope order('name ASC')
  
  
  
end
