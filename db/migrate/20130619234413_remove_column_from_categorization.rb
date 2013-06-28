class RemoveColumnFromCategorization < ActiveRecord::Migration
  def up
    remove_column :categorizations, :category_id
  end

  def down
    add_column :categorizations, :category_id
  end
end
