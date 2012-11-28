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

ActiveRecord::Schema.define(:version => 20121124231104) do

  create_table "cutes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "image_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cutes", ["image_id", "user_id"], :name => "index_cutes_on_image_id_and_user_id", :unique => true

  create_table "embeds", :force => true do |t|
    t.integer  "image_id"
    t.string   "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "embeds", ["code"], :name => "index_embeds_on_code", :unique => true
  add_index "embeds", ["image_id"], :name => "index_embeds_on_image_id", :unique => true

  create_table "images", :force => true do |t|
    t.string   "url"
    t.string   "title"
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "price"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "tumblr"
    t.string   "instagram"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "image_url"
    t.integer  "instagram_id"
    t.integer  "tumblr_id"
    t.string   "full_name"
    t.integer  "facebook"
    t.string   "facebook_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
