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

ActiveRecord::Schema.define(version: 20161201192531) do

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
    t.index ["slug"], name: "index_class_pages_on_slug"
  end

end
