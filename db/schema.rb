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

ActiveRecord::Schema.define(:version => 20131215111451) do

  create_table "code", :force => true do |t|
    t.string   "title_en"
    t.text     "description_en"
    t.string   "download"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.integer  "importance",     :default => 0, :null => false
    t.string   "slug"
    t.string   "title_ja"
    t.text     "description_ja"
  end

  add_index "code", ["slug"], :name => "index_code_on_cached_slug", :unique => true

  create_table "code_languages", :id => false, :force => true do |t|
    t.integer "code_id"
    t.integer "language_id"
  end

  add_index "code_languages", ["code_id", "language_id"], :name => "index_code_languages_on_code_id_and_language_id", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "name_en"
    t.string   "email"
    t.text     "content_en"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.string   "name_ja"
    t.text     "content_ja"
  end

  create_table "languages", :force => true do |t|
    t.string   "name_en"
    t.string   "url_en"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "name_ja"
    t.string   "url_ja"
  end

  add_index "languages", ["slug"], :name => "index_languages_on_cached_slug", :unique => true

  create_table "posts", :force => true do |t|
    t.string   "title_en"
    t.text     "content_en"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "personal",   :default => false
    t.string   "slug"
    t.boolean  "published",  :default => false, :null => false
    t.string   "title_ja"
    t.text     "content_ja"
  end

  add_index "posts", ["slug"], :name => "index_posts_on_cached_slug", :unique => true

end
