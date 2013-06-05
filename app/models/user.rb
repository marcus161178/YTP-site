class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :client_images_attributes, :email, :password, :password_confirmation, :remember_me, :admin, :bride_first_name, :bride_last_name, :groom_last_name, :groom_first_name, :username, :alt_email, :phone_number, :alt_phone_number, :address
  # attr_accessible :title, :body
  
  has_many :client_images
  accepts_nested_attributes_for :client_images, :allow_destroy => true
  
  has_many :galleries, :through => :client_images
  
  
  
  extend FriendlyId
    friendly_id :username, use: :slugged
    
    validates_uniqueness_of :username
end
