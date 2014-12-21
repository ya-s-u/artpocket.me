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

ActiveRecord::Schema.define(version: 20141221143646) do

  create_table "categories", force: true do |t|
    t.string   "title",      null: false
    t.string   "title_ja",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "managers", force: true do |t|
    t.string   "username",   null: false
    t.string   "mail",       null: false
    t.string   "password",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "post_id"
    t.integer  "priority"
    t.text     "image_meta"
  end

  add_index "pictures", ["post_id"], name: "index_pictures_on_post_id", using: :btree

  create_table "places", force: true do |t|
    t.string   "title",                              null: false
    t.string   "title_ja",                           null: false
    t.text     "body"
    t.string   "url"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "mail"
    t.integer  "phone"
    t.decimal  "latitude",   precision: 9, scale: 6
    t.decimal  "longitude",  precision: 9, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "id_hash",                  null: false
    t.string   "title"
    t.text     "body"
    t.integer  "category_id",              null: false
    t.date     "open_date",                null: false
    t.date     "close_date",               null: false
    t.time     "open_time",                null: false
    t.time     "close_time",               null: false
    t.integer  "charge",                   null: false
    t.string   "promoter",                 null: false
    t.string   "url"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "mail"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "place",       default: "", null: false
    t.integer  "place_id"
  end

  create_table "users", force: true do |t|
    t.integer  "udid",       null: false
    t.string   "sex",        null: false
    t.integer  "birthday",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
