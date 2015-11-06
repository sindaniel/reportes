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

ActiveRecord::Schema.define(version: 20151105162547) do

  create_table "records", force: true do |t|
    t.datetime "fecha"
    t.integer  "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "report_id"
  end

  create_table "reports", force: true do |t|
    t.string   "nombre"
    t.text     "text1"
    t.text     "text2"
    t.text     "text3"
    t.text     "text4"
    t.text     "text5"
    t.text     "text6"
    t.text     "text7"
    t.text     "text8"
    t.text     "text9"
    t.text     "text10"
    t.string   "conclusion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
  end

end
