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

ActiveRecord::Schema.define(version: 20170125230107) do

  create_table "announcements", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
  end

  create_table "class_pages", force: :cascade do |t|
    t.string   "class_title"
    t.text     "class_content"
    t.integer  "order_position"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slug"
    t.string   "class_photo_file_name"
    t.string   "class_photo_content_type"
    t.integer  "class_photo_file_size"
    t.datetime "class_photo_updated_at"
    t.datetime "start_time"
    t.boolean  "recurring_event"
    t.datetime "start_time_1"
    t.datetime "start_time_2"
    t.datetime "start_time_3"
    t.datetime "start_time_4"
    t.datetime "start_time_5"
    t.datetime "start_time_6"
    t.datetime "start_time_7"
    t.datetime "start_time_8"
    t.datetime "start_time_9"
    t.datetime "start_time_10"
    t.datetime "start_time_11"
    t.datetime "start_time_12"
    t.index ["slug"], name: "index_class_pages_on_slug"
  end

  create_table "students", force: :cascade do |t|
    t.string   "class_name"
    t.string   "student_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
