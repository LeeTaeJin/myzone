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

ActiveRecord::Schema.define(version: 20151116135427) do

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.string   "en_name"
    t.string   "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "freeboards", force: :cascade do |t|
    t.integer  "fb_user_id"
    t.string   "fb_title"
    t.text     "fb_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "sender"
    t.string   "receiver"
    t.string   "content"
    t.string   "opinion_select"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "freeboard_id"
    t.integer  "user_id"
    t.string   "rp_name"
    t.string   "rp_content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "building"
    t.integer  "room_id"
    t.string   "user"
    t.string   "department"
    t.string   "professor"
    t.date     "date"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.string   "purpose"
    t.string   "state"
    t.integer  "accept_people"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "building_name"
    t.string   "room_number"
    t.integer  "accept_people"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "sidealerts", force: :cascade do |t|
    t.string   "content"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "room_id"
    t.string   "subject_name"
    t.string   "subject_time"
    t.string   "day"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "student_name",           default: "", null: false
    t.string   "student_number",         default: "", null: false
    t.string   "department",             default: "", null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["student_number"], name: "index_users_on_student_number", unique: true

end
