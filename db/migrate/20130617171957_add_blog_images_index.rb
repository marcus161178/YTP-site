class AddBlogImagesIndex < ActiveRecord::Migration
  def up
add_index :blog_images, :post_id, :name => 'index_blog_images_on_post_id'  
end

  def down
remove_index :blog_images, :post_id, :name => 'index_blog_images_on_post_id' 
  end
end
