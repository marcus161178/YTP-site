class AddClientImagesIndex < ActiveRecord::Migration
  def up
add_index :client_images, :user_id, :name => 'index_client_images_on_user_id'
  end

  def down
remove__index :client_images, :user_id, :name => 'index_client_images_on_user_id'
  end
end
