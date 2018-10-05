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

ActiveRecord::Schema.define(version: 2018_10_05_192204) do

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.string "thumbnail"
    t.string "url"
    t.string "site"
    t.integer "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_episodes_on_medium_id"
  end

  create_table "media", force: :cascade do |t|
    t.integer "id_anilist"
    t.integer "id_mal"
    t.string "media_type"
    t.string "format"
    t.string "status"
    t.text "description"
    t.string "start_date"
    t.string "end_date"
    t.string "season"
    t.integer "episodes"
    t.integer "duration"
    t.integer "chapters"
    t.integer "volumes"
    t.string "country_of_origin"
    t.boolean "is_licensed"
    t.string "source"
    t.string "hashtag"
    t.integer "updated_at_anilist"
    t.integer "average_score"
    t.integer "mean_score"
    t.boolean "is_adult"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_pictures", force: :cascade do |t|
    t.string "size"
    t.string "description"
    t.string "link"
    t.integer "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_media_pictures_on_medium_id"
  end

  create_table "media_titles", force: :cascade do |t|
    t.string "code"
    t.string "title"
    t.integer "medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medium_id"], name: "index_media_titles_on_medium_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
