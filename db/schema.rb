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

ActiveRecord::Schema.define(:version => 20120914065860) do

  create_table "domains", :force => true do |t|
    t.string   "fqdn"
    t.string   "alias"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "mail_path"
  end

  create_table "mailboxes", :force => true do |t|
    t.string   "user_name"
    t.string   "password"
    t.integer  "domain_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "saphira_file_items", :force => true do |t|
    t.string   "name"
    t.string   "item_type"
    t.string   "file_uid"
    t.string   "file_name"
    t.string   "slug"
    t.string   "path"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.text     "dynamic_attributes"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "saphira_file_items", ["lft"], :name => "index_saphira_file_items_on_lft"
  add_index "saphira_file_items", ["parent_id"], :name => "index_saphira_file_items_on_parent_id"
  add_index "saphira_file_items", ["path"], :name => "index_saphira_file_items_on_path", :unique => true
  add_index "saphira_file_items", ["rgt"], :name => "index_saphira_file_items_on_rgt"
  add_index "saphira_file_items", ["slug"], :name => "index_saphira_file_items_on_slug"

  create_table "saphira_image_variants", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "manipulation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "gid"
    t.integer  "uid"
    t.integer  "role"
  end

end
