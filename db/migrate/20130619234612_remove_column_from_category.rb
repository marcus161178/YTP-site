class RemoveColumnFromCategory < ActiveRecord::Migration
  def up
    remove_column :Categories, :ancestry
    
  end

  def down
    add_column :Categories, :ancestry
  end
end
