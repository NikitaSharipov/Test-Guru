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

ActiveRecord::Schema.define(version: 2018_09_15_151620) do

  create_table "answers", force: :cascade do |t|
    t.string "body", null: false
    t.boolean "correct", default: false, null: false
    t.integer "questions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questions_id"], name: "index_answers_on_questions_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "body", null: false
    t.integer "tests_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tests_id"], name: "index_questions_on_tests_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title", null: false
    t.integer "level", default: 1
    t.integer "categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_tests_on_categories_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end