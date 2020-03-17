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

ActiveRecord::Schema.define(version: 2020_03_17_080510) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "common_code_types", force: :cascade do |t|
    t.string "name"
    t.string "engName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "common_codes", force: :cascade do |t|
    t.integer "codeTypeId"
    t.string "name"
    t.string "engName"
    t.integer "parentId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", force: :cascade do |t|
    t.text "description"
    t.string "type"
    t.integer "typeSize"
    t.string "mainCategoryId"
    t.string "middleCategoryId"
    t.string "subCategoryId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms_words", force: :cascade do |t|
    t.integer "termsId"
    t.integer "wordId"
    t.integer "seq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.string "engName"
    t.string "shortEng"
    t.string "entity"
    t.string "column"
    t.string "class"
    t.string "classMember"
    t.string "paramValue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
