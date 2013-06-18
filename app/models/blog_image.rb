class BlogImage < ActiveRecord::Base
  attr_accessible :image, :name, :post_id, :vieworder
  belongs_to :post
  mount_uploader :image, ImageUploader
  before_create :default_name, :default_order

default_scope :order => 'vieworder ASC, created_at ASC'

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
end

def default_order

self.vieworder ||=File.basename(image.filename, '.*').last(2).to_i if image


end

end
