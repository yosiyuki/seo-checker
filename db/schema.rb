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

ActiveRecord::Schema.define(:version => 20111111015412) do

  create_table "site_logs", :force => true do |t|
    t.integer  "site_id",                   :null => false
    t.date     "checked_on",                :null => false
    t.integer  "sites",      :default => 0, :null => false
    t.integer  "links",      :default => 0, :null => false
    t.integer  "relateds",   :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "site_logs", ["checked_on"], :name => "index_site_logs_on_checked_on"
  add_index "site_logs", ["site_id"], :name => "index_site_logs_on_site_id"

  create_table "sites", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "domain",     :null => false
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["domain"], :name => "index_sites_on_domain"
  add_index "sites", ["name"], :name => "index_sites_on_name"

end
