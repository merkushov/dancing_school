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

ActiveRecord::Schema.define(version: 20161215085722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "class_schedules", force: :cascade do |t|
    t.datetime "date_begin",                              null: false
    t.datetime "date_end",                                null: false
    t.decimal  "cost",            precision: 5, scale: 2, null: false
    t.integer  "class_type_id",                           null: false
    t.integer  "user_id",                                 null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "hall_id"
    t.integer  "class_groups_id"
    t.index ["class_groups_id"], name: "index_class_schedules_on_class_groups_id", using: :btree
    t.index ["class_type_id"], name: "index_class_schedules_on_class_type_id", using: :btree
    t.index ["date_begin"], name: "index_class_schedules_on_date_begin", using: :btree
    t.index ["date_end"], name: "index_class_schedules_on_date_end", using: :btree
    t.index ["hall_id"], name: "index_class_schedules_on_hall_id", using: :btree
    t.index ["user_id"], name: "index_class_schedules_on_user_id", using: :btree
  end

  create_table "class_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["name"], name: "index_class_types_on_name", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",   limit: 127, null: false
    t.string   "last_name",    limit: 127, null: false
    t.string   "middle_name",  limit: 127
    t.string   "email"
    t.string   "phone_mobile", limit: 10
    t.date     "birthday"
    t.string   "gender",       limit: 1
    t.string   "photo"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["email"], name: "index_customers_on_email", using: :btree
    t.index ["first_name", "last_name", "middle_name"], name: "index_customers_on_first_name_and_last_name_and_middle_name", using: :btree
    t.index ["phone_mobile"], name: "index_customers_on_phone_mobile", using: :btree
  end

  create_table "customers_class_groups", id: false, force: :cascade do |t|
    t.integer "customer_id",    null: false
    t.integer "class_group_id", null: false
    t.index ["class_group_id", "customer_id"], name: "index_customers_class_groups_on_class_group_id_and_customer_id", using: :btree
    t.index ["customer_id", "class_group_id"], name: "index_customers_class_groups_on_customer_id_and_class_group_id", using: :btree
  end

  create_table "halls", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["location_id"], name: "index_halls_on_location_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "address"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "prices", force: :cascade do |t|
    t.string   "name",                 limit: 255,                 null: false
    t.string   "status",               limit: 64,                  null: false
    t.decimal  "value",                            default: "0.0"
    t.string   "period_start_type",                                null: false
    t.string   "period_end_type",                                  null: false
    t.integer  "period_end_days"
    t.datetime "period_start_date"
    t.datetime "period_end_date"
    t.string   "visit_limit_type",                                 null: false
    t.integer  "visit_number"
    t.integer  "visit_hour_number"
    t.text     "description"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "no_scope_class_types",             default: true
    t.boolean  "no_scope_locations",               default: true
    t.boolean  "no_scope_users",                   default: true
  end

  create_table "prices_class_types", id: false, force: :cascade do |t|
    t.integer "price_id",      null: false
    t.integer "class_type_id", null: false
    t.index ["class_type_id", "price_id"], name: "index_prices_class_types_on_class_type_id_and_price_id", using: :btree
    t.index ["class_type_id"], name: "index_prices_class_types_on_class_type_id", using: :btree
    t.index ["price_id", "class_type_id"], name: "index_prices_class_types_on_price_id_and_class_type_id", using: :btree
    t.index ["price_id"], name: "index_prices_class_types_on_price_id", using: :btree
  end

  create_table "prices_locations", id: false, force: :cascade do |t|
    t.integer "price_id",    null: false
    t.integer "location_id", null: false
    t.index ["location_id", "price_id"], name: "index_prices_locations_on_location_id_and_price_id", using: :btree
    t.index ["location_id"], name: "index_prices_locations_on_location_id", using: :btree
    t.index ["price_id", "location_id"], name: "index_prices_locations_on_price_id_and_location_id", using: :btree
    t.index ["price_id"], name: "index_prices_locations_on_price_id", using: :btree
  end

  create_table "prices_users", id: false, force: :cascade do |t|
    t.integer "price_id", null: false
    t.integer "user_id",  null: false
    t.index ["price_id", "user_id"], name: "index_prices_users_on_price_id_and_user_id", using: :btree
    t.index ["price_id"], name: "index_prices_users_on_price_id", using: :btree
    t.index ["user_id", "price_id"], name: "index_prices_users_on_user_id_and_price_id", using: :btree
    t.index ["user_id"], name: "index_prices_users_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 127, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree
    t.index ["role_id"], name: "index_roles_users_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", using: :btree
    t.index ["user_id"], name: "index_roles_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255, null: false
    t.string   "first_name",      limit: 127, null: false
    t.string   "last_name",       limit: 127, null: false
    t.string   "password_digest",             null: false
    t.string   "remember_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "class_schedule_id"
    t.integer  "customer_id"
    t.boolean  "is_paid"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["class_schedule_id", "customer_id"], name: "index_visits_on_class_schedule_id_and_customer_id", unique: true, using: :btree
    t.index ["class_schedule_id"], name: "index_visits_on_class_schedule_id", using: :btree
    t.index ["customer_id"], name: "index_visits_on_customer_id", using: :btree
  end

  add_foreign_key "class_schedules", "class_groups", column: "class_groups_id"
  add_foreign_key "class_schedules", "class_types"
  add_foreign_key "class_schedules", "halls"
  add_foreign_key "class_schedules", "users"
  add_foreign_key "customers_class_groups", "class_groups", on_delete: :cascade
  add_foreign_key "customers_class_groups", "customers", on_delete: :cascade
  add_foreign_key "halls", "locations"
  add_foreign_key "prices_class_types", "class_types"
  add_foreign_key "prices_class_types", "prices"
  add_foreign_key "prices_locations", "locations"
  add_foreign_key "prices_locations", "prices"
  add_foreign_key "prices_users", "prices"
  add_foreign_key "prices_users", "users"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
  add_foreign_key "visits", "class_schedules"
  add_foreign_key "visits", "customers"
end
