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

ActiveRecord::Schema.define(version: 20151010113607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carriers", force: :cascade do |t|
    t.string   "carrier_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city_name"
    t.string   "state_code"
    t.integer  "zip_code"
    t.string   "contact_name1"
    t.string   "email1"
    t.string   "phone_nbr1"
    t.string   "contact_name2"
    t.string   "email2"
    t.string   "phone_nbr2"
    t.text     "comments"
    t.string   "added_by"
    t.string   "changed_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.decimal  "required_weight_tons",            precision: 5, scale: 2
    t.integer  "required_weight_lbs"
    t.decimal  "remaining_weight_tons",           precision: 5, scale: 2
    t.integer  "remaining_weight_lbs"
    t.integer  "vendor_id"
    t.string   "well_name"
    t.string   "sand_grade"
    t.date     "start_date"
    t.boolean  "active"
    t.string   "added_by"
    t.string   "changed_by"
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "po_nbr",                limit: 8
  end

  add_index "purchase_orders", ["po_nbr"], name: "index_purchase_orders_on_po_nbr", unique: true, using: :btree
  add_index "purchase_orders", ["remaining_weight_lbs"], name: "index_purchase_orders_on_remaining_weight_lbs", using: :btree
  add_index "purchase_orders", ["vendor_id"], name: "index_purchase_orders_on_vendor_id", using: :btree

  create_table "rail_cars", force: :cascade do |t|
    t.string   "railcar_nbr"
    t.decimal  "wgt_on_arrival",                precision: 5, scale: 2
    t.decimal  "wgt_at_origin",                 precision: 5, scale: 2
    t.string   "sand_grade"
    t.boolean  "car_empty"
    t.integer  "bol_nbr",             limit: 8
    t.integer  "vendor_id"
    t.integer  "vendor_po_nbr",       limit: 8
    t.boolean  "email_bol"
    t.integer  "purchaseorder_id"
    t.datetime "arrival_dt_elk_city"
    t.datetime "arrival_dt_400_line"
    t.datetime "actual_dep_dt"
    t.datetime "arrival_dt_onsite"
    t.datetime "bol_arrival_dt"
    t.string   "added_by"
    t.string   "changed_by"
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.text     "doc_comment"
    t.datetime "doc_updated_at"
  end

  add_index "rail_cars", ["car_empty"], name: "index_rail_cars_on_car_empty", using: :btree
  add_index "rail_cars", ["purchaseorder_id"], name: "index_rail_cars_on_purchaseorder_id", using: :btree
  add_index "rail_cars", ["vendor_id"], name: "index_rail_cars_on_vendor_id", using: :btree

  create_table "railcardocs", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "trailers", force: :cascade do |t|
    t.string   "trailer_nbr"
    t.string   "driver_name"
    t.integer  "carrier_id"
    t.date     "date_shipped"
    t.integer  "bol_nbr",           limit: 8
    t.datetime "time_in"
    t.datetime "time_out"
    t.string   "time_taken_number"
    t.string   "railcar_nbr"
    t.string   "worker"
    t.integer  "weight_lbs"
    t.decimal  "weight_tons",                 precision: 5, scale: 2
    t.integer  "purchaseorder_id"
    t.string   "added_by"
    t.string   "changed_by"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.text     "doc_comment"
    t.datetime "doc_updated_at"
    t.integer  "carriers_id"
  end

  add_index "trailers", ["carriers_id"], name: "index_trailers_on_carriers_id", using: :btree
  add_index "trailers", ["purchaseorder_id"], name: "index_trailers_on_purchaseorder_id", using: :btree

  create_table "user_access_levels", force: :cascade do |t|
    t.string   "access_level"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "login"
    t.string   "password_digest"
    t.integer  "user_role"
    t.integer  "pwreset"
    t.string   "added_by"
    t.string   "changed_by"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "vendor_name"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city_name"
    t.string   "state_code"
    t.integer  "zip_code"
    t.string   "contact_name1"
    t.string   "email1"
    t.string   "phone_nbr1"
    t.string   "contact_name2"
    t.string   "email2"
    t.string   "phone_nbr2"
    t.text     "comments"
    t.string   "added_by"
    t.string   "changed_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
