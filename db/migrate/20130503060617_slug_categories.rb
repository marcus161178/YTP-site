class SlugCategories < ActiveRecord::Migration
    def change
      add_column :categories, :slug, :string
      add_index :categories, :slug, unique: true
      add_index :categories, :name, unique:true
      add_column :posts, :slug, :string
      add_index :posts, :slug, unique: true
      add_index :posts, :title, unique:true
    end
  end

