class CreatePhotoPackages < ActiveRecord::Migration
  def change
    create_table :photo_packages do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
