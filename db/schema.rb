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

ActiveRecord::Schema[7.2].define(version: 2024_09_26_122122) do
  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.string "article_number"
    t.string "article_text"
    t.decimal "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
  end

  create_table "inventory_entries", force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "employee_id", null: false
    t.integer "quantity"
    t.date "entry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_inventory_entries_on_article_id"
    t.index ["employee_id"], name: "index_inventory_entries_on_employee_id"
  end

  create_table "inventory_exits", force: :cascade do |t|
    t.integer "article_id", null: false
    t.integer "employee_id", null: false
    t.integer "quantity"
    t.date "exit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_inventory_exits_on_article_id"
    t.index ["employee_id"], name: "index_inventory_exits_on_employee_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "whodunnit"
    t.datetime "created_at"
    t.bigint "item_id", null: false
    t.string "item_type", null: false
    t.string "event", null: false
    t.text "object", limit: 1073741823
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "inventory_entries", "articles"
  add_foreign_key "inventory_entries", "employees"
  add_foreign_key "inventory_exits", "articles"
  add_foreign_key "inventory_exits", "employees"
end
