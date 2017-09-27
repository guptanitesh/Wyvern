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

ActiveRecord::Schema.define(version: 20170917124910) do

  create_table "answers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quizz_id"
    t.integer "question_id"
    t.integer "score"
    t.string "ans"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["quizz_id"], name: "index_answers_on_quizz_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "body", null: false
    t.integer "quizz_id"
    t.string "answer", null: false
    t.string "option2", null: false
    t.string "option3", null: false
    t.string "option1", null: false
    t.string "option4", null: false
    t.boolean "qtype", default: false, null: false
    t.string "ftype", default: "text", null: false
    t.string "asset", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quizz_id"], name: "index_questions_on_quizz_id"
  end

  create_table "quizzs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "subcategory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id"], name: "index_quizzs_on_subcategory_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "quizz_id"
    t.integer "user_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quizz_id"], name: "index_scores_on_quizz_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "email", limit: 100, null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.string "username", limit: 50, null: false
    t.boolean "rememberme", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
