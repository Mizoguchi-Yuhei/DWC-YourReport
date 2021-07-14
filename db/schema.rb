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

ActiveRecord::Schema.define(version: 2021_07_12_032111) do

  create_table "follow_requests", force: :cascade do |t|
    t.integer "learner_id"
    t.integer "observer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer "learner_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "learners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_learners_on_email", unique: true
    t.index ["name"], name: "index_learners_on_name", unique: true
    t.index ["reset_password_token"], name: "index_learners_on_reset_password_token", unique: true
  end

  create_table "observer_follows", force: :cascade do |t|
    t.integer "learner_id"
    t.integer "observer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "observers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_observers_on_email", unique: true
    t.index ["name"], name: "index_observers_on_name", unique: true
    t.index ["reset_password_token"], name: "index_observers_on_reset_password_token", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "test_id"
    t.text "name"
    t.integer "score"
    t.integer "perfect"
    t.integer "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer "learner_id"
    t.text "name"
    t.text "pros"
    t.text "cons"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
