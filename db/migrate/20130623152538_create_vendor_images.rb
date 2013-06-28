class CreateVendorImages < ActiveRecord::Migration
  def change
    create_table :vendor_images do |t|
      t.string :name
      t.integer :subcategory_id
      t.string :portfolio

      t.timestamps
    end
  end
end
