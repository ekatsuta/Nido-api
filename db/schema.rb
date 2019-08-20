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

ActiveRecord::Schema.define(version: 2019_08_17_201759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "num_members"
    t.string "guest_type"
    t.string "household_preference"
    t.text "special_notes"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cases_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_cases", force: :cascade do |t|
    t.bigint "case_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_language_cases_on_case_id"
    t.index ["language_id"], name: "index_language_cases_on_language_id"
  end

  create_table "language_listings", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_language_listings_on_language_id"
    t.index ["listing_id"], name: "index_language_listings_on_listing_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_provisions", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "provision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_listing_provisions_on_listing_id"
    t.index ["provision_id"], name: "index_listing_provisions_on_provision_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "address"
    t.string "room_type"
    t.integer "capacity"
    t.text "description"
    t.string "household_type"
    t.string "guest_preference"
    t.decimal "longitude"
    t.decimal "latitude"
    t.boolean "children"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.bigint "listing_id"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_pictures_on_listing_id"
  end

  create_table "placements", force: :cascade do |t|
    t.bigint "listing_id"
    t.bigint "case_id"
    t.string "period"
    t.string "status"
    t.boolean "checked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["case_id"], name: "index_placements_on_case_id"
    t.index ["listing_id"], name: "index_placements_on_listing_id"
  end

  create_table "provisions", force: :cascade do |t|
    t.string "provision"
    t.string "icon_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.text "description"
    t.string "user_type"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cases", "users"
  add_foreign_key "language_cases", "cases"
  add_foreign_key "language_cases", "languages"
  add_foreign_key "language_listings", "languages"
  add_foreign_key "language_listings", "listings"
  add_foreign_key "listing_provisions", "listings"
  add_foreign_key "listing_provisions", "provisions"
  add_foreign_key "listings", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "pictures", "listings"
  add_foreign_key "placements", "cases"
  add_foreign_key "placements", "listings"
end
