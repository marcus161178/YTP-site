class Gallery < ActiveRecord::Base
  attr_accessible :name
  has_many :client_images
  belongs_to :user
  
  
  extend FriendlyId
    friendly_id :name, use: :slugged
end
