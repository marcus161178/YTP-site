class RenameColumn < ActiveRecord::Migration
  def up
rename_column :client_videos, :client_id, :user_id
 end

  def down
rename_column :client_videos, :user_id, :client_id
  
end
end
