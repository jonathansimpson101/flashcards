# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_02_160127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "card_scores", force: :cascade do |t|
    t.boolean "correct"
    t.bigint "scores_id", null: false
    t.bigint "cards_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cards_id"], name: "index_card_scores_on_cards_id"
    t.index ["scores_id"], name: "index_card_scores_on_scores_id"
  end

  create_table "cards", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "question"
    t.string "attempt"
    t.string "answer"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "deck_id", null: false
    t.index ["deck_id"], name: "index_categories_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "deck_id", null: false
    t.integer "total"
    t.index ["deck_id"], name: "index_scores_on_deck_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "card_id", null: false
    t.bigint "deck_id", null: false
    t.index ["card_id"], name: "index_topics_on_card_id"
    t.index ["deck_id"], name: "index_topics_on_deck_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_scores", "cards", column: "cards_id"
  add_foreign_key "card_scores", "scores", column: "scores_id"
  add_foreign_key "categories", "decks"
  add_foreign_key "decks", "users"
  add_foreign_key "scores", "decks"
  add_foreign_key "scores", "users"
  add_foreign_key "topics", "cards"
  add_foreign_key "topics", "decks"
end
