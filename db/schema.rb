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

ActiveRecord::Schema.define(version: 2021_07_20_060051) do

  create_table "discounts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "first_item_id", null: false
    t.integer "second_item_id", null: false
    t.decimal "first_item_discount_rate", precision: 2, scale: 2, null: false
    t.decimal "second_item_discount_rate", precision: 2, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["first_item_id"], name: "index_discounts_on_first_item_id"
    t.index ["second_item_id"], name: "index_discounts_on_second_item_id"
  end

  create_table "items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.decimal "tax_rate", precision: 2, scale: 2, null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_items_on_name"
  end

  create_table "order_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "order_id", null: false
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.decimal "tax_amount", precision: 10, scale: 2, default: "0.0"
    t.decimal "tax_rate", precision: 2, scale: 2, default: "0.0"
    t.decimal "amount_with_tax", precision: 10, scale: 2, null: false
    t.integer "quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "browser", null: false
    t.string "platform", null: false
    t.decimal "total", precision: 10, scale: 2, null: false
    t.decimal "sub_total", precision: 10, scale: 2, null: false
    t.decimal "discount_amount", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["browser"], name: "index_orders_on_browser"
    t.index ["platform"], name: "index_orders_on_platform"
    t.index ["total"], name: "index_orders_on_total"
  end

end
