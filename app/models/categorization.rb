class Categorization < ActiveRecord::Base
  attr_accessible :cateory_id, :post_id
  belongs_to :category
  belongs_to :post
end
