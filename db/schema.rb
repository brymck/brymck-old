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

ActiveRecord::Schema.define(:version => 20110820052320) do

  create_table "addresses", :force => true do |t|
    t.string  "country"
    t.string  "zip"
    t.string  "state"
    t.string  "city"
    t.string  "street"
    t.string  "extra"
    t.integer "location_id"
  end

  add_index "addresses", ["location_id"], :name => "index_addresses_on_location_id"

  create_table "business_hours", :force => true do |t|
    t.string  "opening"
    t.string  "closing"
    t.string  "time_zone"
    t.integer "location_id"
    t.boolean "sunday",      :default => false
    t.boolean "monday",      :default => false
    t.boolean "tuesday",     :default => false
    t.boolean "wednesday",   :default => false
    t.boolean "thursday",    :default => false
    t.boolean "friday",      :default => false
    t.boolean "saturday",    :default => false
  end

  add_index "business_hours", ["location_id"], :name => "index_business_hours_on_location_id"

  create_table "code", :force => true do |t|
    t.string    "title"
    t.text      "description"
    t.string    "download"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "source"
    t.integer   "importance",  :default => 0, :null => false
    t.string    "cached_slug"
  end

  add_index "code", ["cached_slug"], :name => "index_code_on_cached_slug", :unique => true

  create_table "code_languages", :id => false, :force => true do |t|
    t.integer "code_id"
    t.integer "language_id"
  end

  add_index "code_languages", ["code_id", "language_id"], :name => "index_code_languages_on_code_id_and_language_id", :unique => true

  create_table "code_tags", :id => false, :force => true do |t|
    t.integer "code_id"
    t.integer "tag_id"
  end

  add_index "code_tags", ["code_id", "tag_id"], :name => "index_code_tags_on_code_id_and_tag_id", :unique => true

  create_table "code_translations", :force => true do |t|
    t.integer   "code_id"
    t.string    "locale"
    t.string    "title"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "code_translations", ["code_id"], :name => "index_code_translations_on_code_id"

  create_table "comment_translations", :force => true do |t|
    t.integer   "comment_id"
    t.string    "locale"
    t.string    "name"
    t.text      "content"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "comment_translations", ["comment_id"], :name => "index_comment_translations_on_comment_id"

  create_table "comments", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.text      "content"
    t.integer   "post_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "parent_id"
    t.integer   "lft"
    t.integer   "rgt"
  end

  create_table "language_translations", :force => true do |t|
    t.integer   "language_id"
    t.string    "locale"
    t.string    "url"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "language_translations", ["language_id"], :name => "index_language_translations_on_language_id"

  create_table "languages", :force => true do |t|
    t.string    "name"
    t.string    "url"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "cached_slug"
  end

  add_index "languages", ["cached_slug"], :name => "index_languages_on_cached_slug", :unique => true

  create_table "location_translations", :force => true do |t|
    t.integer   "location_id"
    t.string    "locale"
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "location_translations", ["location_id"], :name => "index_location_translations_on_location_id"

  create_table "locations", :force => true do |t|
    t.string "name"
    t.string "cached_slug"
  end

  create_table "metric_translations", :force => true do |t|
    t.integer   "metric_id"
    t.string    "locale"
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "metric_translations", ["metric_id"], :name => "index_metric_translations_on_metric_id"

  create_table "metrics", :force => true do |t|
    t.string  "name",        :null => false
    t.string  "regex",       :null => false
    t.string  "cached_slug"
    t.integer "source_id"
  end

  add_index "metrics", ["cached_slug"], :name => "index_metrics_on_cached_slug", :unique => true
  add_index "metrics", ["name", "source_id"], :name => "index_metrics_on_name_and_source_id"
  add_index "metrics", ["name"], :name => "index_metrics_on_name"
  add_index "metrics", ["source_id"], :name => "index_metrics_on_source_id"

  create_table "portfolio_translations", :force => true do |t|
    t.integer   "portfolio_id"
    t.string    "locale"
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "portfolio_translations", ["portfolio_id"], :name => "index_portfolio_translations_on_portfolio_id"

  create_table "portfolios", :force => true do |t|
    t.string "name",        :null => false
    t.string "cached_slug"
  end

  add_index "portfolios", ["cached_slug"], :name => "index_portfolios_on_cached_slug", :unique => true
  add_index "portfolios", ["name"], :name => "index_portfolios_on_name"

  create_table "portfolios_quotes", :id => false, :force => true do |t|
    t.integer "portfolio_id", :null => false
    t.integer "quote_id",     :null => false
  end

  add_index "portfolios_quotes", ["portfolio_id", "quote_id"], :name => "index_portfolios_quotes_on_portfolio_id_and_quote_id", :unique => true

  create_table "post_translations", :force => true do |t|
    t.integer   "post_id"
    t.string    "locale"
    t.string    "title"
    t.text      "content"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "post_translations", ["post_id"], :name => "index_post_translations_on_post_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "personal",    :default => false
    t.string   "cached_slug"
    t.boolean  "published",   :default => false, :null => false
  end

  add_index "posts", ["cached_slug"], :name => "index_posts_on_cached_slug", :unique => true

  create_table "posts_tags", :id => false, :force => true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "posts_tags", ["post_id", "tag_id"], :name => "index_posts_tags_on_post_id_and_tag_id", :unique => true

  create_table "quote_translations", :force => true do |t|
    t.integer   "quote_id"
    t.string    "locale"
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "quote_translations", ["quote_id"], :name => "index_quote_translations_on_quote_id"

  create_table "quotes", :force => true do |t|
    t.string "name",        :null => false
    t.string "ticker",      :null => false
    t.string "cached_slug"
  end

  add_index "quotes", ["cached_slug"], :name => "index_quotes_on_cached_slug", :unique => true
  add_index "quotes", ["name"], :name => "index_quotes_on_name"
  add_index "quotes", ["ticker"], :name => "index_quotes_on_ticker"

  create_table "quotes_sources", :id => false, :force => true do |t|
    t.integer "source_id", :null => false
    t.integer "quote_id",  :null => false
  end

  add_index "quotes_sources", ["quote_id", "source_id"], :name => "index_quotes_sources_on_quote_id_and_source_id", :unique => true

  create_table "slugs", :force => true do |t|
    t.string    "name"
    t.integer   "sluggable_id"
    t.integer   "sequence",                     :default => 1, :null => false
    t.string    "sluggable_type", :limit => 40
    t.string    "scope"
    t.timestamp "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "source_translations", :force => true do |t|
    t.integer  "source_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "source_translations", ["source_id"], :name => "index_source_translations_on_source_id"

  create_table "sources", :force => true do |t|
    t.string "name",        :null => false
    t.string "cached_slug"
    t.string "url",         :null => false
  end

  add_index "sources", ["cached_slug"], :name => "index_sources_on_cached_slug", :unique => true
  add_index "sources", ["name"], :name => "index_sources_on_name"
  add_index "sources", ["url"], :name => "index_sources_on_url", :unique => true

  create_table "subscribers", :force => true do |t|
    t.string   "name",                            :null => false
    t.string   "email",                           :null => false
    t.boolean  "approved",     :default => false, :null => false
    t.boolean  "active",       :default => true,  :null => false
    t.boolean  "unsubscribed", :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "test",         :default => false, :null => false
  end

  add_index "subscribers", ["email"], :name => "index_subscribers_on_email", :unique => true
  add_index "subscribers", ["name"], :name => "index_subscribers_on_name"
  add_index "subscribers", ["test"], :name => "index_subscribers_on_test"

  create_table "tag_translations", :force => true do |t|
    t.integer   "tag_id"
    t.string    "locale"
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "tag_translations", ["tag_id"], :name => "index_tag_translations_on_tag_id"

  create_table "tags", :force => true do |t|
    t.string "name"
    t.string "cached_slug"
  end

  add_index "tags", ["cached_slug"], :name => "index_tags_on_cached_slug", :unique => true
  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

end
