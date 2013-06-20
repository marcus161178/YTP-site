class Subcategorization < ActiveRecord::Base
  attr_accessible :category_id, :subcategory_id
  
  has_many :categorizations
  belongs_to :category
  belongs_to :subcategory
  
  has_many :posts, :through => :categorization
  
  def subcategory_name
    subcategory.name
  end
  
end
