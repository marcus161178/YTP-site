class AddColumnToBlogImages < ActiveRecord::Migration
  def change
    add_column :blog_images, :frontpage, :boolean, :default => 1
  end
end
