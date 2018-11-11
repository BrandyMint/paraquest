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

ActiveRecord::Schema.define(version: 2018_11_10_121240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bundle_games", force: :cascade do |t|
    t.bigint "bundle_id", null: false
    t.bigint "user_id", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bundle_id", "user_id"], name: "index_bundle_games_on_bundle_id_and_user_id", unique: true
    t.index ["bundle_id"], name: "index_bundle_games_on_bundle_id"
    t.index ["user_id"], name: "index_bundle_games_on_user_id"
  end

  create_table "bundles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "title"], name: "index_bundles_on_user_id_and_title", unique: true
    t.index ["user_id"], name: "index_bundles_on_user_id"
  end

  create_table "slide_games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "slide_id", null: false
    t.decimal "x", null: false
    t.decimal "y", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", null: false
    t.bigint "bundle_game_id", null: false
    t.index ["bundle_game_id", "slide_id"], name: "index_slide_games_on_bundle_game_id_and_slide_id", unique: true
    t.index ["bundle_game_id"], name: "index_slide_games_on_bundle_game_id"
    t.index ["slide_id"], name: "index_slide_games_on_slide_id"
    t.index ["user_id"], name: "index_slide_games_on_user_id"
  end

  create_table "slides", force: :cascade do |t|
    t.string "image", null: false
    t.text "details", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "width", null: false
    t.integer "height", null: false
    t.bigint "bundle_id", null: false
    t.index ["bundle_id"], name: "index_slides_on_bundle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "failed_logins_count", default: 0
    t.datetime "lock_expires_at"
    t.string "unlock_token"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string "last_login_from_ip_address"
    t.string "nick", null: false
    t.string "role", default: "user", null: false
    t.string "name"
    t.text "bio"
    t.string "image"
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at"
    t.index ["nick"], name: "index_users_on_nick", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["unlock_token"], name: "index_users_on_unlock_token"
  end

  add_foreign_key "bundle_games", "bundles"
  add_foreign_key "bundle_games", "users"
  add_foreign_key "bundles", "users"
  add_foreign_key "slide_games", "slides"
  add_foreign_key "slide_games", "users"
end
