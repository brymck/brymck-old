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

ActiveRecord::Schema.define(:version => 20110806054804) do

  create_table "code", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "download"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
    t.integer  "importance",  :default => 0, :null => false
    t.string   "cached_slug"
  end

  add_index "code", ["cached_slug"], :name => "index_code_on_cached_slug", :unique => true

  create_table "code_languages", :id => false, :force => true do |t|
    t.integer "code_id"
    t.integer "language_id"
  end

  add_index "code_languages", ["code_id", "language_id"], :name => "index_code_languages_on_code_id_and_language_id", :unique => true

  create_table "code_translations", :force => true do |t|
    t.integer  "code_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "code_translations", ["code_id"], :name => "index_code_translations_on_code_id"

  create_table "comment_translations", :force => true do |t|
    t.integer  "comment_id"
    t.string   "locale"
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comment_translations", ["comment_id"], :name => "index_comment_translations_on_comment_id"

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
  end

  create_table "language_translations", :force => true do |t|
    t.integer  "language_id"
    t.string   "locale"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "language_translations", ["language_id"], :name => "index_language_translations_on_language_id"

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
  end

  add_index "languages", ["cached_slug"], :name => "index_languages_on_cached_slug", :unique => true

  create_table "post_translations", :force => true do |t|
    t.integer  "post_id"
    t.string   "locale"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_translations", ["post_id"], :name => "index_post_translations_on_post_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "personal",    :default => false
    t.string   "cached_slug"
  end

  add_index "posts", ["cached_slug"], :name => "index_posts_on_cached_slug", :unique => true

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

end
