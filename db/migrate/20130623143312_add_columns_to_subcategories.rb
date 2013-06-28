class AddColumnsToSubcategories < ActiveRecord::Migration
  def change
    add_column :subcategories, :email, :string
    add_column :subcategories, :description, :text
    add_column :subcategories, :phone_number, :integer
    add_column :subcategories, :website, :string
  end
end
