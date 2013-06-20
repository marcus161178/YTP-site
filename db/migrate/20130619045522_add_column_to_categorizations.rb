class AddColumnToCategorizations < ActiveRecord::Migration
  def change
    add_column :categorizations, :subcategory_id, :integer
    add_column :categorizations, :subcategorization_id, :integer
    add_index  :categorizations, :subcategory_id, :name => 'index_categorizations_on_subcategory_id'
    add_index :categorizations, :subcategorization_id, :name => 'index_categorizations_on_subcategorization_id'
  end
end
