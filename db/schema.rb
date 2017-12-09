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

ActiveRecord::Schema.define(version: 20171209095431) do

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.string "sex"
    t.string "age_min"
    t.integer "age_max"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.integer "age"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date"
    t.string "time"
    t.datetime "dob"
    t.string "country"
    t.string "language"
    t.string "education"
    t.string "occupation"
    t.integer "height_feet"
    t.integer "height_inch"
    t.string "college_attended"
    t.string "annual_income"
    t.string "education_field"
    t.string "diet"
    t.string "body_type"
    t.string "skin_tone"
    t.string "describe_yourself"
    t.string "rashi"
    t.string "marital_status"
    t.string "email"
    t.string "password_digest"
    t.string "auth_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
