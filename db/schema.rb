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

ActiveRecord::Schema.define(version: 20180702152918) do

  create_table "games", force: :cascade do |t|
    t.string   "koname"
    t.string   "enname"
    t.string   "company"
    t.string   "picurl_300"
    t.string   "picurl_blur"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "post_overwatches", force: :cascade do |t|
    t.integer  "game_id"
    t.string   "title",                   null: false
    t.string   "game_mode",               null: false
    t.string   "role",                    null: false
    t.string   "tier",       default: ""
    t.datetime "play_date",               null: false
    t.string   "use_mic",                 null: false
    t.string   "battletag",               null: false
    t.string   "comment",                 null: false
    t.integer  "now_member", default: 0,  null: false
    t.integer  "all_member",              null: false
    t.integer  "user_id",                 null: false
    t.string   "ip_address",              null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["game_id"], name: "index_post_overwatches_on_game_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
