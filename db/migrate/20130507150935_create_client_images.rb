class CreateClientImages < ActiveRecord::Migration
  def change
    create_table :client_images do |t|
      t.string :name
      t.integer :user_id
      t.string :photo
      t.integer :gallery_id

      t.timestamps
    end
  end
end
