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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170408144710) do

  create_table "keyword_logs", force: :cascade do |t|
    t.integer  "keyword_id", null: false
    t.integer  "rank",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  add_index "keyword_logs", ["keyword_id"], name: "index_keyword_logs_on_keyword_id"

  create_table "keywords", force: :cascade do |t|
    t.integer  "site_id",                null: false
    t.string   "word",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keywords", ["site_id"], name: "index_keywords_on_site_id"

  create_table "site_logs", force: :cascade do |t|
    t.integer  "site_id",                null: false
    t.date     "checked_on",             null: false
    t.integer  "sites",      default: 0, null: false
    t.integer  "links",      default: 0, null: false
    t.integer  "relateds",   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_logs", ["checked_on"], name: "index_site_logs_on_checked_on"
  add_index "site_logs", ["site_id"], name: "index_site_logs_on_site_id"

  create_table "sites", force: :cascade do |t|
    t.string   "name",       limit: 255,                null: false
    t.string   "domain",     limit: 255,                null: false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lang",       limit: 255, default: "jp", null: false
  end

  add_index "sites", ["domain"], name: "index_sites_on_domain"
  add_index "sites", ["name"], name: "index_sites_on_name"

end
