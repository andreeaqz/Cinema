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

ActiveRecord::Schema.define(version: 20160702081401) do

  create_table "films", force: :cascade do |t|
    t.string   "title"
    t.integer  "rating"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "rank",       default: 0
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "running_film_id"
    t.integer  "user_id"
    t.string   "seats"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "running_films", force: :cascade do |t|
    t.integer  "film_id"
    t.string   "time"
    t.string   "seats",      default: "--- []\n"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nume"
    t.string   "prenume"
    t.string   "telefon"
    t.string   "email"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
  end

end
