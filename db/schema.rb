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

ActiveRecord::Schema.define(:version => 20130215053401) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "text"
  end

  create_table "cutes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cutes", ["image_id", "user_id"], :name => "index_cutes_on_image_id_and_user_id", :unique => true

  create_table "follows", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "follows", ["follower_id", "followed_id"], :name => "index_follows_on_follower_id_and_followed_id", :unique => true

  create_table "images", :force => true do |t|
    t.string   "url"
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.datetime "created_time"
    t.string   "location_name"
    t.string   "low_url"
    t.string   "thumb"
    t.integer  "user_id"
    t.string   "code"
    t.boolean  "published"
    t.integer  "category_id"
    t.datetime "published_at"
  end

  create_table "images_products", :force => true do |t|
    t.integer  "image_id"
    t.integer  "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "images_products", ["image_id", "product_id"], :name => "index_images_products_on_image_id_and_product_id", :unique => true

  create_table "products", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.float    "price"
    t.integer  "image_id"
    t.string   "name"
    t.integer  "ssid"
    t.string   "retailer"
    t.text     "description", :limit => 255
    t.string   "brandname"
    t.string   "brandid"
    t.string   "brandurl"
    t.string   "low_url"
    t.string   "big_url"
    t.string   "thumb_url"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "tumblr"
    t.string   "instagram"
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "image_url"
    t.integer  "instagram_id"
    t.integer  "tumblr_id"
    t.string   "full_name"
    t.integer  "facebook",               :limit => 8
    t.string   "facebook_token"
    t.boolean  "admin"
    t.integer  "followers_number",                    :default => 0
    t.integer  "following_number",                    :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
