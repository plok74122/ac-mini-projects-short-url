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

ActiveRecord::Schema.define(version: 20160522155125) do

  create_table "short_url_lists", force: :cascade do |t|
    t.string   "unique_string",             null: false
    t.string   "redirect_to",               null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "count",         default: 0
  end

  add_index "short_url_lists", ["unique_string"], name: "index_short_url_lists_on_unique_string", unique: true

end
