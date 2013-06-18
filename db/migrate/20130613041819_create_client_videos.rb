class CreateClientVideos < ActiveRecord::Migration
  def change
    create_table :client_videos do |t|
      t.string :name
      t.string :url
      t.integer :client_id

      t.timestamps
    end
  end
end
