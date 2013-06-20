class ChgsToUserTable < ActiveRecord::Migration
    def change
      change_table(:users) do |t|
        t.string :alt_email,               :default => ""
        t.integer :phone_number
        t.integer :alt_phone_number
        t.rename :bridename, :bride_first_name
        t.rename :groomname, :groom_first_name
        t.string :bride_last_name, :null => false, :default => ""
        t.string :groom_last_name, :null => false, :default => ""
        

    end
  end
end
 