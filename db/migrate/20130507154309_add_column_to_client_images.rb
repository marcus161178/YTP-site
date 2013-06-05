class AddColumnToClientImages < ActiveRecord::Migration
  def change
    add_column :client_images, :frontslideshow, :boolean, :default => false
  end
end
