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

ActiveRecord::Schema.define(version: 20170611154051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "image", default: "app/assets/images/MMlogo.jpg", null: false
    t.string "name", default: "Une carte", null: false
    t.integer "rarity", default: 1, null: false
    t.integer "health_point", default: 1, null: false
    t.integer "attack_point", default: 1, null: false
    t.integer "move_point", default: 1, null: false
    t.integer "wood_cost", default: 1, null: false
    t.integer "iron_cost", default: 1, null: false
    t.integer "food_cost", default: 1, null: false
    t.integer "special_ability1_id"
    t.integer "special_ability2_id"
    t.integer "sell_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.integer "card_1"
    t.integer "card_2"
    t.integer "card_3"
    t.integer "card_4"
    t.integer "card_5"
    t.integer "card_6"
    t.integer "card_7"
    t.integer "card_8"
    t.integer "card_9"
    t.integer "card_10"
    t.integer "card_11"
    t.integer "card_12"
    t.integer "card_13"
    t.integer "card_14"
    t.integer "card_15"
    t.integer "card_16"
    t.integer "card_17"
    t.integer "card_18"
    t.integer "card_19"
    t.integer "card_20"
    t.integer "card_21"
    t.integer "card_22"
    t.integer "card_23"
    t.integer "card_24"
    t.integer "card_25"
    t.integer "card_26"
    t.integer "card_27"
    t.integer "card_28"
    t.integer "card_29"
    t.integer "card_30"
    t.integer "card_31"
    t.integer "card_32"
    t.integer "card_33"
    t.integer "card_34"
    t.integer "card_35"
    t.integer "card_36"
    t.integer "card_37"
    t.integer "card_38"
    t.integer "card_39"
    t.integer "card_40"
    t.integer "card_41"
    t.integer "card_42"
    t.integer "card_43"
    t.integer "card_44"
    t.integer "card_45"
    t.integer "card_46"
    t.integer "card_47"
    t.integer "card_48"
    t.integer "card_49"
    t.integer "card_50"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "kibrilles_packs", force: :cascade do |t|
    t.integer "kibrilles", null: false
    t.decimal "euros", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.integer "card_1"
    t.integer "card_2"
    t.integer "card_3"
    t.integer "card_4"
    t.integer "card_5"
    t.integer "card_6"
    t.integer "card_7"
    t.integer "card_8"
    t.integer "card_9"
    t.integer "card_10"
    t.integer "card_11"
    t.integer "card_12"
    t.integer "card_13"
    t.integer "card_14"
    t.integer "card_15"
    t.integer "card_16"
    t.integer "card_17"
    t.integer "card_18"
    t.integer "card_19"
    t.integer "card_20"
    t.integer "card_21"
    t.integer "card_22"
    t.integer "card_23"
    t.integer "card_24"
    t.integer "card_25"
    t.integer "card_26"
    t.integer "card_27"
    t.integer "card_28"
    t.integer "card_29"
    t.integer "card_30"
    t.integer "card_31"
    t.integer "card_32"
    t.integer "card_33"
    t.integer "card_34"
    t.integer "card_35"
    t.integer "card_36"
    t.integer "card_37"
    t.integer "card_38"
    t.integer "card_39"
    t.integer "card_40"
    t.integer "card_41"
    t.integer "card_42"
    t.integer "card_43"
    t.integer "card_44"
    t.integer "card_45"
    t.integer "card_46"
    t.integer "card_47"
    t.integer "card_48"
    t.integer "card_49"
    t.integer "card_50"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_libraries_on_user_id"
  end

  create_table "purchase_histories", force: :cascade do |t|
    t.integer "kibrilles", null: false
    t.integer "euros", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchase_histories_on_user_id"
  end

  create_table "special_abilities", force: :cascade do |t|
    t.string "name", null: false
    t.text "effect", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", null: false
    t.boolean "admin", default: false, null: false
    t.integer "dingdings", default: 1000, null: false
    t.integer "kibrilles", default: 0, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar", default: "goblin-head", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "decks", "users"
  add_foreign_key "libraries", "users"
  add_foreign_key "purchase_histories", "users"
end
