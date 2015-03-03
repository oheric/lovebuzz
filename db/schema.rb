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

ActiveRecord::Schema.define(version: 20150303093558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.string   "content"
    t.integer  "question_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "option_value"
  end

  create_table "questions", force: true do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quiz_id"
  end

  add_index "questions", ["quiz_id"], name: "index_quiz_id", using: :btree

  create_table "quizzes", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: true do |t|
    t.integer "result_value"
    t.string  "content"
    t.integer "quiz_id"
  end

  add_index "results", ["quiz_id"], name: "result_value_index_quiz_id", using: :btree

  create_table "traits", force: true do |t|
    t.text    "content"
    t.integer "user_id"
    t.integer "quiz_id"
  end

  add_index "traits", ["quiz_id"], name: "index_traits_on_quiz_id", using: :btree
  add_index "traits", ["user_id"], name: "index_traits_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.date     "birthday"
    t.string   "gender"
    t.string   "orientation"
    t.integer  "zipcode"
    t.string   "country"
    t.string   "username"
    t.string   "userbio"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

end
