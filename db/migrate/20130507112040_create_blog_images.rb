class CreateBlogImages < ActiveRecord::Migration
  def change
    create_table :blog_images do |t|
      t.string :name
      t.string :image
      t.integer :post_id

      t.timestamps
    end
  end
end
