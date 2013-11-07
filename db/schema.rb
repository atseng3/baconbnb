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

ActiveRecord::Schema.define(:version => 20131106194109) do

  create_table "amenities", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "pad_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "amenities", ["name"], :name => "index_amenities_on_name"

  create_table "bookings", :force => true do |t|
    t.integer  "booker_id",  :null => false
    t.integer  "pad_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "neighborhoods", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "tag_line"
  end

  add_index "neighborhoods", ["name"], :name => "index_neighborhoods_on_name"

  create_table "pad_amenities", :force => true do |t|
    t.integer  "pad_id",     :null => false
    t.integer  "amenity_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pads", :force => true do |t|
    t.string   "name",                                         :null => false
    t.text     "description",                                  :null => false
    t.string   "address",                                      :null => false
    t.integer  "owner_id",                                     :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "latitude"
    t.string   "longitude"
    t.string   "room_type",       :default => "Private room"
    t.string   "bed_type",        :default => "Real Bed"
    t.integer  "accomodates",     :default => 1
    t.integer  "bathrooms",       :default => 1
    t.integer  "min_stay",        :default => 1
    t.string   "country",         :default => "United States"
    t.string   "city",            :default => "San Francisco"
    t.string   "neighborhood",    :default => "Marina"
    t.string   "cancellation",    :default => "Flexible"
    t.integer  "neighborhood_id"
  end

  add_index "pads", ["address"], :name => "index_pads_on_address"

  create_table "photos", :force => true do |t|
    t.integer  "pad_id",             :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "f_name",          :null => false
    t.string   "l_name",          :null => false
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "session_token",   :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true

end
