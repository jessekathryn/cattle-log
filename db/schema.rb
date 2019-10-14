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

ActiveRecord::Schema.define(version: 20191013051638) do

  create_table "cows", force: :cascade do |t|
    t.string  "name"
    t.integer "tag_number"
    t.string  "type"
    t.integer "age"
    t.integer "birthdate"
    t.integer "weight"
    t.string  "health"
    t.string  "color"
    t.integer "user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string  "notes"
    t.integer "user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string  "field_name"
    t.integer "acreage"
    t.string  "crop"
    t.integer "coordinates"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "cows"
    t.string "fields"
    t.string "expenses"
  end

end
