class CreateWeddings < ActiveRecord::Migration
  def change
    create_table :weddings do |t|
      t.integer :user_id
      t.datetime :date
      t.integer :photo_package_id,  :default => 1
      t.boolean :engagement_shoot, :default => false
      t.boolean :cinematography, :default => false
      t.string :country,  :default => "Trinidad"
      t.string :bride_getting_ready
      t.string :groom_getting_ready
      t.string :ceremony_location
      t.string :ceremony_setting
      t.integer :type_of_ceremony_id
      t.datetime :ceremony_time
      t.string :reception_location
      t.text :order_of_events
      t.integer :bridesmaids
      t.integer :groomsmen
      t.integer :number_of_guests
      t.string :photography_style
      t.string :payment_currency
      t.string :payment_method
      t.string :how_did_you_find_us
      t.string :recommended_by
      t.text :notes

      t.timestamps
    end
  end
end
