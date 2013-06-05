class ChgsToUsers < ActiveRecord::Migration
  def change
    change_column :users, :phone_number, :integer, :null => true, :default => ""
    change_column :users, :alt_phone_number, :integer, :null => true, :default => ""
    change_column :users, :bride_last_name, :string, :null => true, :default => ""
    change_column :users, :groom_last_name, :string, :null => true, :default => ""
  end
end
