class AddTypeToClientVideos < ActiveRecord::Migration
  def change
add_column :client_videos, :video_type, :string  
end
end
