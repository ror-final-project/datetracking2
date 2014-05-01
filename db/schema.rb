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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140427211757) do
=======
ActiveRecord::Schema.define(version: 20140501160904) do
>>>>>>> john

  create_table "answers", force: true do |t|
    t.integer  "user_id"
    t.integer  "datee_id"
    t.integer  "result_id"
    t.integer  "suvery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.integer  "user_id"
    t.integer  "datee_id"
    t.integer  "friendly_id"
    t.integer  "post_exp_id"
    t.integer  "recent_exp_od"
    t.integer  "upcoming_exp_id"
    t.datetime "date"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fname"
  end

  create_table "relationships", force: true do |t|
    t.integer  "user_id"
    t.integer  "datee_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: true do |t|
    t.integer  "user_id"
    t.integer  "datee_id"
<<<<<<< HEAD
=======
    t.integer  "answer",     limit: 255
>>>>>>> john
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answer"
  end

  create_table "user_surveys", force: true do |t|
    t.integer "user_id"
    t.integer "survey_id"
  end

  create_table "users", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_experiences"
  end

end
