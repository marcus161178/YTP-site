class ClientImage < ActiveRecord::Base
  attr_accessible :gallery_id, :name, :photo, :user_id
  belongs_to :gallery
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  
  before_create :default_name
  
    def default_name
      self.name ||= File.basename(photo.filename, '.*').titleize if photo
    end
    
    default_scope order('name ASC')
    
end
