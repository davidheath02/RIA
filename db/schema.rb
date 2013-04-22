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

ActiveRecord::Schema.define(:version => 20130315154317) do

  create_table "co_sizes", :id => false, :force => true do |t|
    t.integer  "company_id",   :default => 0, :null => false
    t.string   "no_employees"
    t.datetime "read_at",                     :null => false
  end

  create_table "companies", :id => false, :force => true do |t|
    t.integer  "company_id",    :default => 0, :null => false
    t.string   "industry_name"
    t.string   "co_name"
    t.string   "co_type"
    t.string   "co_ticker"
    t.datetime "read_at",                      :null => false
  end

  create_table "connections", :id => false, :force => true do |t|
    t.integer  "user_id",         :default => 0,  :null => false
    t.integer  "num_connections", :default => -1
    t.datetime "read_at",                         :null => false
  end

  create_table "locations", :id => false, :force => true do |t|
    t.integer  "user_id",      :default => 0, :null => false
    t.string   "country_code"
    t.string   "country_name"
    t.datetime "read_at",                     :null => false
  end

  create_table "positions", :id => false, :force => true do |t|
    t.integer  "job_id",      :default => 0, :null => false
    t.integer  "user_id",     :default => 0, :null => false
    t.integer  "company_id"
    t.datetime "start_date"
    t.string   "is_current"
    t.string   "job_title"
    t.text     "job_summary"
    t.datetime "read_at",                    :null => false
  end

  create_table "titles", :id => false, :force => true do |t|
    t.integer  "user_id",  :default => 0, :null => false
    t.string   "headline"
    t.datetime "read_at",                 :null => false
  end

  create_table "user_industries", :id => false, :force => true do |t|
    t.integer  "user_id",       :default => 0, :null => false
    t.string   "industry_name"
    t.datetime "start_date"
    t.datetime "read_at",                      :null => false
  end

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.string   "profile_url"
    t.string   "firstName"
    t.datetime "read_at"
  end

  add_index "users", ["profile_url"], :name => "profile_url", :unique => true

end
