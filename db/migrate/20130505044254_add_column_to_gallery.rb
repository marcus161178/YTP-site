class AddColumnToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :slug, :string
    add_index :galleries, :slug, unique: true
    add_index :galleries, :name, unique:true
  end
end
