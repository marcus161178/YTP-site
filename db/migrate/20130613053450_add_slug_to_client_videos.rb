class AddSlugToClientVideos < ActiveRecord::Migration
  def change
add_column :client_videos, :slug, :string
add_index :client_videos, :slug, unique: true 
 end
end
