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

ActiveRecord::Schema.define(version: 20180304215929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_labels", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "label_id"
    t.index ["label_id"], name: "index_user_labels_on_label_id"
    t.index ["user_id"], name: "index_user_labels_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday"
    t.string "nationality"
    t.string "occupation"
    t.integer "role", default: 0
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "moniker"
  end

  create_table "venue_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venue_category_labels", force: :cascade do |t|
    t.bigint "label_id"
    t.bigint "venue_category_id"
    t.index ["label_id"], name: "index_venue_category_labels_on_label_id"
    t.index ["venue_category_id"], name: "index_venue_category_labels_on_venue_category_id"
  end

  add_foreign_key "user_labels", "labels"
  add_foreign_key "user_labels", "users"
  add_foreign_key "venue_category_labels", "labels"
  add_foreign_key "venue_category_labels", "venue_categories"
end
