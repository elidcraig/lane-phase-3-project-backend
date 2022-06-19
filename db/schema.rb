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

ActiveRecord::Schema.define(version: 2022_06_19_163313) do

  create_table "guests", force: :cascade do |t|
    t.string "username"
    t.string "profile_image_url"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "username"
    t.string "profile_image_url"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "guest_id"
    t.integer "vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "year"
    t.string "image_url"
    t.text "description"
    t.integer "price_per_day"
    t.integer "host_id"
  end

end
