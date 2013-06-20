class Categorization < ActiveRecord::Base
  attr_accessible :post_id, :subcategorization_id
  
  belongs_to :post
  belongs_to :subcategorization
  
  has_many :categories, :through => :subcategorization
  has_many :subcategories, :through => :subcategorization
  

  
end
