class DropTableComments < ActiveRecord::Migration
  def up
    drop_table :Comments
  end

  def down
  end
end
