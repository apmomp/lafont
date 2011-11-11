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

ActiveRecord::Schema.define(:version => 20111111212622) do

  create_table "bill_lines", :force => true do |t|
    t.integer  "bill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",      :precision => 6, :scale => 2
    t.integer  "name_id"
  end

  add_index "bill_lines", ["bill_id"], :name => "index_bill_lines_on_bill_id"

  create_table "bill_states", :force => true do |t|
    t.string "name"
  end

  create_table "bills", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "state_id",   :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cash_id"
  end

  add_index "bills", ["cash_id"], :name => "index_bills_on_cash_id"

  create_table "cashes", :force => true do |t|
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total",      :precision => 10, :scale => 2
  end

  create_table "food_cats", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "section_id"
  end

  add_index "food_cats", ["section_id"], :name => "index_food_cats_on_section_id"

  create_table "foods", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.decimal  "price",      :precision => 6, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cat_id"
  end

  add_index "foods", ["cat_id"], :name => "index_foods_on_cat_id"

  create_table "names", :force => true do |t|
    t.string "name"
  end

  add_index "names", ["name"], :name => "index_names_on_name"

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "nick"
    t.boolean  "admin",              :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["nick"], :name => "index_users_on_nick", :unique => true

end
