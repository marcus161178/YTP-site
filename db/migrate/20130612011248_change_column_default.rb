class ChangeColumnDefault < ActiveRecord::Migration
  def up
change_column_default(:blog_images, :vieworder, nil)  
end

  def down
  end
end
