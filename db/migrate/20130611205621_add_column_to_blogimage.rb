class AddColumnToBlogimage < ActiveRecord::Migration
  def change
    add_column :blog_images, :vieworder, :integer, :default => 1
  end
end
