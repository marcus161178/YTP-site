class BlogImage < ActiveRecord::Base
  attr_accessible :image, :name, :post_id
  belongs_to :post
  mount_uploader :image, ImageUploader
  before_create :default_name

  def default_name
    self.name ||= File.basename(image.filename, '.*').titleize if image
  end
end
