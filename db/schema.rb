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

ActiveRecord::Schema.define(version: 20150501095045) do

  create_table "book_by_providers", force: :cascade do |t|
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "provider_id"
    t.integer  "book_id"
  end

  add_index "book_by_providers", ["book_id"], name: "index_book_by_providers_on_book_id"
  add_index "book_by_providers", ["provider_id"], name: "index_book_by_providers_on_provider_id"

  create_table "book_in_uses", force: :cascade do |t|
    t.date     "fromDate"
    t.date     "toDate"
    t.date     "returnDate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "book_id"
    t.integer  "reader_id"
  end

  add_index "book_in_uses", ["book_id"], name: "index_book_in_uses_on_book_id"
  add_index "book_in_uses", ["reader_id"], name: "index_book_in_uses_on_reader_id"

  create_table "book_types", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.date     "publish_year"
    t.float    "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "category_id"
  end

  add_index "book_types", ["category_id"], name: "index_book_types_on_category_id"

  create_table "books", force: :cascade do |t|
    t.string   "barcode"
    t.string   "INNcode"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "book_type_id"
    t.integer  "status_id"
  end

  add_index "books", ["book_type_id"], name: "index_books_on_book_type_id"
  add_index "books", ["status_id"], name: "index_books_on_status_id"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "providers", ["user_id"], name: "index_providers_on_user_id"

  create_table "readers", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "address"
    t.string   "passport"
    t.date     "birth_date"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "readers", ["user_id"], name: "index_readers_on_user_id"

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
