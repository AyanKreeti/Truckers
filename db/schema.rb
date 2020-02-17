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

ActiveRecord::Schema.define(version: 2020_02_07_110723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deliveries", force: :cascade do |t|
    t.bigint "schedule_id"
    t.bigint "order_id"
    t.integer "sequence"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_deliveries_on_order_id"
    t.index ["schedule_id", "order_id"], name: "index_deliveries_on_schedule_id_and_order_id", unique: true
    t.index ["schedule_id"], name: "index_deliveries_on_schedule_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.float "lat"
    t.float "lng"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "trucker_id"
    t.date "delivery_date"
    t.string "schedule_name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trucker_id"], name: "index_schedules_on_trucker_id"
  end

  create_table "truckers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "deliveries", "orders"
  add_foreign_key "deliveries", "schedules"
  add_foreign_key "schedules", "truckers"
end
