class RemoveColumnFromCategory < ActiveRecord::Migration
  def up
    remove_column :categories, :ancestry
    
  end

  def down
    add_column :categories, :ancestry
  end
end
