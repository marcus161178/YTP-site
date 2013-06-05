# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130510014040) do

  create_table "blog_images", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
    t.string   "slug"
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"
  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true
  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true

  create_table "categorizations", :force => true do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categorizations", ["category_id"], :name => "index_categorizations_on_category_id"
  add_index "categorizations", ["post_id"], :name => "index_categorizations_on_post_id"

  create_table "client_images", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "photo"
    t.integer  "gallery_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "frontslideshow", :default => false
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "galleries", ["name"], :name => "index_galleries_on_name", :unique => true
  add_index "galleries", ["slug"], :name => "index_galleries_on_slug", :unique => true

  create_table "photo_packages", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "slug"
    t.boolean  "published",    :default => false
    t.datetime "published_at"
  end

  add_index "posts", ["slug"], :name => "index_posts_on_slug", :unique => true
  add_index "posts", ["title"], :name => "index_posts_on_title", :unique => true

  create_table "users", :force => true do |t|
    t.string   "bride_first_name"
    t.string   "groom_first_name"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "alt_email",              :default => ""
    t.integer  "phone_number",           :default => 0
    t.integer  "alt_phone_number",       :default => 0
    t.string   "bride_last_name",        :default => ""
    t.string   "groom_last_name",        :default => ""
    t.boolean  "admin",                  :default => false
    t.string   "slug"
    t.text     "address"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "post_id"
  end

  create_table "weddings", :force => true do |t|
    t.integer  "user_id"
    t.datetime "date"
    t.integer  "photo_package_id",    :default => 1
    t.boolean  "engagement_shoot",    :default => false
    t.boolean  "cinematography",      :default => false
    t.string   "country",             :default => "Trinidad"
    t.string   "bride_getting_ready"
    t.string   "groom_getting_ready"
    t.string   "ceremony_location"
    t.string   "ceremony_setting"
    t.integer  "type_of_ceremony_id"
    t.datetime "ceremony_time"
    t.string   "reception_location"
    t.text     "order_of_events"
    t.integer  "bridesmaids"
    t.integer  "groomsmen"
    t.integer  "number_of_guests"
    t.string   "photography_style"
    t.string   "payment_currency"
    t.string   "payment_method"
    t.string   "how_did_you_find_us"
    t.string   "recommended_by"
    t.text     "notes"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

end
