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

ActiveRecord::Schema.define(version: 20170408151939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "department_preferences", force: :cascade do |t|
    t.string   "stream"
    t.string   "department"
    t.integer  "preference_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "event_accomodations", force: :cascade do |t|
    t.boolean  "accomodation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "event_banners", force: :cascade do |t|
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "event_brouchers", force: :cascade do |t|
    t.string   "broucher_file_name"
    t.string   "broucher_content_type"
    t.integer  "broucher_file_size"
    t.datetime "broucher_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "event_college_banners", force: :cascade do |t|
    t.string   "college_banner_file_name"
    t.string   "college_banner_content_type"
    t.integer  "college_banner_file_size"
    t.datetime "college_banner_updated_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "event_contact_details", force: :cascade do |t|
    t.string   "designation"
    t.string   "name"
    t.string   "email"
    t.string   "phone_no"
    t.string   "general_support"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "event_id"
  end

  create_table "event_department_streams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "stream_id"
  end

  create_table "event_departments_events", id: false, force: :cascade do |t|
    t.integer "event_id",            null: false
    t.integer "event_department_id", null: false
  end

  create_table "event_departments_preferences", id: false, force: :cascade do |t|
    t.integer "event_department_id", null: false
    t.integer "preference_id",       null: false
  end

  create_table "event_details", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "event_description"
    t.text     "sub_events"
    t.text     "workshops"
    t.text     "paper_presentation_topics"
    t.text     "conference_topics"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "reg_start_date"
    t.datetime "reg_end_date"
    t.text     "reg_fee"
  end

  create_table "event_extras", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_extras_events", id: false, force: :cascade do |t|
    t.integer "event_id",       null: false
    t.integer "event_extra_id", null: false
  end

  create_table "event_favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_favourite", default: false
  end

  create_table "event_goings", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "may_be_count", default: 0
    t.integer  "going_count",  default: 0
    t.integer  "reach_count",  default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "event_guest_details", force: :cascade do |t|
    t.string   "name"
    t.string   "designation"
    t.string   "company"
    t.string   "delegation"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "event_sponsors", force: :cascade do |t|
    t.string   "sponsor_file_name"
    t.string   "sponsor_content_type"
    t.integer  "sponsor_file_size"
    t.datetime "sponsor_updated_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "event_id"
  end

  create_table "event_subscriptions", force: :cascade do |t|
    t.string   "email_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_types_preferences", id: false, force: :cascade do |t|
    t.integer "event_type_id", null: false
    t.integer "preference_id", null: false
  end

  create_table "event_urls", force: :cascade do |t|
    t.string   "web_link"
    t.string   "registration_link"
    t.string   "college_link"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "youtube_link"
    t.string   "apps_link"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_no"
    t.string   "event_name"
    t.string   "event_type"
    t.string   "study_place"
    t.string   "country"
    t.string   "state"
    t.string   "district"
    t.string   "zip"
    t.integer  "event_detail_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "event_url_id"
    t.integer  "event_accomodation_id"
    t.integer  "event_banner_id"
    t.integer  "event_college_banner_id"
    t.integer  "event_broucher_id"
    t.integer  "event_sponsor_id"
    t.boolean  "is_published",            default: false
    t.string   "dept_stream"
    t.integer  "user_id"
  end

  create_table "location_preferences", force: :cascade do |t|
    t.string   "country"
    t.string   "state"
    t.string   "district"
    t.integer  "preference_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "notification_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "notification_type_id"
    t.string   "message"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "preference_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "preference_type_id"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "stream_preference"
  end

  create_table "registration_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_no"
    t.string   "place_of_study"
    t.string   "passed_out_year"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "registration_type"
    t.string   "dept"
    t.string   "official_email_id"
    t.string   "company"
    t.string   "last_name"
    t.string   "auth_value"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
