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

ActiveRecord::Schema.define(:version => 20120308182847) do

  create_table "dishes", :force => true do |t|
    t.string   "title",                     :null => false
    t.string   "alpha_desc"
    t.integer  "tray",       :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gingredients", :force => true do |t|
    t.string   "api_name",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gitems", :force => true do |t|
    t.string   "title",                               :null => false
    t.string   "alpha_desc"
    t.integer  "sort",             :default => 0
    t.boolean  "required",         :default => false
    t.integer  "gingredient_id"
    t.integer  "gnoodlerecipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gitems", ["gingredient_id"], :name => "index_gitems_on_gingredient_id"
  add_index "gitems", ["gnoodlerecipe_id"], :name => "index_gitems_on_gnoodlerecipe_id"

  create_table "gnoodleportions", :force => true do |t|
    t.string   "legend",           :null => false
    t.integer  "dish_id"
    t.integer  "gnoodlerecipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gnoodleportions", ["dish_id"], :name => "index_gnoodleportions_on_dish_id"
  add_index "gnoodleportions", ["gnoodlerecipe_id"], :name => "index_gnoodleportions_on_gnoodlerecipe_id"

  create_table "gnoodlerecipes", :force => true do |t|
    t.string   "title"
    t.string   "alpha_desc"
    t.text     "long_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gnoodles", :force => true do |t|
    t.string   "resource_key",      :null => false
    t.string   "alpha_desc"
    t.integer  "gnoodleportion_id"
    t.integer  "gitem_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gnoodles", ["gitem_id"], :name => "index_gnoodles_on_gitem_id"
  add_index "gnoodles", ["gnoodleportion_id"], :name => "index_gnoodles_on_gnoodleportion_id"

  create_table "managers", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
