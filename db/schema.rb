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

ActiveRecord::Schema.define(version: 20140425053339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "response_id"
    t.integer  "choice_id"
    t.integer  "question_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "other"
  end

  add_index "answers", ["choice_id"], name: "index_answers_on_choice_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["response_id", "question_id"], name: "index_answers_on_response_id_and_question_id", using: :btree
  add_index "answers", ["response_id"], name: "index_answers_on_response_id", using: :btree

  create_table "choices", force: true do |t|
    t.integer  "question_id"
    t.text     "text"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "allow_text",  default: false
  end

  add_index "choices", ["question_id"], name: "index_choices_on_question_id", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "position"
    t.integer  "survey_id"
    t.string   "kind"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["survey_id"], name: "index_questions_on_survey_id", using: :btree

  create_table "responses", force: true do |t|
    t.integer  "survey_id"
    t.string   "ip"
    t.string   "referer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "embed"
    t.datetime "start_at"
    t.datetime "stop_at"
    t.string   "email"
    t.string   "embedder"
  end

  add_index "responses", ["email"], name: "index_responses_on_email", using: :btree
  add_index "responses", ["survey_id"], name: "index_responses_on_survey_id", using: :btree

  create_table "surveys", force: true do |t|
    t.string   "title"
    t.string   "token"
    t.string   "passcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["passcode"], name: "index_surveys_on_passcode", using: :btree
  add_index "surveys", ["token"], name: "index_surveys_on_token", using: :btree

end
