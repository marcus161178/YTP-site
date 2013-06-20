class RemoveColumnFromCategorization < ActiveRecord::Migration
  def up
    remove_column :Categorizations, :category_id
  end

  def down
    add_column :Categorizations, :category_id
  end
end
