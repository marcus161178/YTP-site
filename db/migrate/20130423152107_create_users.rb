class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :bridename
      t.string :groomname
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
