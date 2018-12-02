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

ActiveRecord::Schema.define(version: 2018_12_01_123546) do

  create_table "dbasses", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dbrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dbass_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dchoruses", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dcrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dchorus_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ddrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ddrum_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ddrums", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dgrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dictation_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dictations", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dkeyboards", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dkrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dkeyboard_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partscores", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pbasses", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pbrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pbass_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pdrum_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pdrums", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pgrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "partscore_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pkeyboards", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.text "discription"
    t.text "request"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pkrequests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pkeyboard_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tweet_id"
    t.boolean "rent", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string "artist"
    t.string "songs"
    t.string "part"
    t.text "discription"
    t.text "request"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", default: "", null: false
    t.string "part"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
