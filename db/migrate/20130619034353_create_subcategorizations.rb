class CreateSubcategorizations < ActiveRecord::Migration
  def change
    create_table :subcategorizations do |t|
      t.integer :category_id
      t.integer :subcategory_id

      t.timestamps
    end
    add_index :subcategorizations, :category_id, :name => 'index_subcategorizations_on_category_id'
    add_index :subcategorizations, :subcategory_id, :name => 'index_subcategorizations_on_subcategory_id'
    
  end
end
