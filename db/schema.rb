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

ActiveRecord::Schema.define(version: 2020_04_13_215125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "role", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "short_description", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.text "requisites", null: false
    t.text "description"
    t.float "rating"
    t.string "website"
    t.string "phone_number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "state", null: false
  end

  create_table "company_cities", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_company_cities_on_city_id"
    t.index ["company_id", "city_id"], name: "index_company_cities_on_company_id_and_city_id", unique: true
    t.index ["company_id"], name: "index_company_cities_on_company_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "client_id", null: false
    t.bigint "company_id", null: false
    t.string "state", null: false
    t.datetime "date_start", null: false
    t.datetime "date_end", null: false
    t.float "review", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_orders_on_client_id"
    t.index ["company_id"], name: "index_orders_on_company_id"
    t.index ["service_id"], name: "index_orders_on_service_id"
  end

  create_table "service_prices", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "city_id", null: false
    t.bigint "company_id", null: false
    t.integer "price", null: false
    t.string "state", null: false 
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_service_prices_on_city_id"
    t.index ["company_id"], name: "index_service_prices_on_company_id"
    t.index ["service_id"], name: "index_service_prices_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "company_cities", "cities"
  add_foreign_key "company_cities", "companies"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "companies"
  add_foreign_key "orders", "services"
  add_foreign_key "service_prices", "cities"
  add_foreign_key "service_prices", "companies"
  add_foreign_key "service_prices", "services"
end
