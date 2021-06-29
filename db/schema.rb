# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_23_055915) do

  create_table "careers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "position", null: false
    t.date "period_start", null: false
    t.date "period_end", null: false
    t.text "business_content", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position"], name: "index_careers_on_position"
    t.index ["user_id"], name: "index_careers_on_user_id"
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "my_company_name", null: false
    t.string "company_image", null: false
    t.integer "prefecture_id", null: false
    t.date "founding_date", null: false
    t.string "phone_number", null: false
    t.string "company_url", null: false
    t.text "company_content", null: false
    t.text "company_purpose", null: false
    t.text "company_environment", null: false
    t.text "ingredients", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prefecture_id"], name: "index_companies_on_prefecture_id"
  end

  create_table "profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "birth_date", null: false
    t.integer "prefecture_id", null: false
    t.text "strong_point", null: false
    t.text "dream", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["birth_date", "prefecture_id"], name: "index_profiles_on_birth_date_and_prefecture_id"
    t.index ["birth_date"], name: "index_profiles_on_birth_date"
    t.index ["prefecture_id"], name: "index_profiles_on_prefecture_id"
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true
  end

  create_table "question_options", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "option_text"
    t.string "personality_type"
    t.integer "point", null: false
    t.integer "sort_order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["personality_type"], name: "index_question_options_on_personality_type"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "message", null: false
    t.string "question_type", null: false
    t.string "personality_type", null: false
    t.integer "sort_order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["personality_type"], name: "index_questions_on_personality_type"
  end

  create_table "user_question_answers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "question_id", null: false
    t.integer "question_option_id"
    t.string "personality_type", null: false
    t.integer "point", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["personality_type", "user_id"], name: "index_user_question_answers_on_personality_type_and_user_id"
    t.index ["personality_type"], name: "index_user_question_answers_on_personality_type"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "last_name", default: "", null: false
    t.string "family_name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "careers", "users"
end
