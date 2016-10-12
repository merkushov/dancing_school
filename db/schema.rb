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

ActiveRecord::Schema.define(version: 20161006204438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_schedules", force: :cascade do |t|
    t.datetime "date_begin",                            null: false
    t.datetime "date_end",                              null: false
    t.decimal  "cost",          precision: 5, scale: 2, null: false
    t.integer  "class_type_id",                         null: false
    t.integer  "location_id",                           null: false
    t.integer  "user_id",                               null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["class_type_id"], name: "index_class_schedules_on_class_type_id", using: :btree
    t.index ["date_begin"], name: "index_class_schedules_on_date_begin", using: :btree
    t.index ["date_end"], name: "index_class_schedules_on_date_end", using: :btree
    t.index ["location_id"], name: "index_class_schedules_on_location_id", using: :btree
    t.index ["user_id"], name: "index_class_schedules_on_user_id", using: :btree
  end

  create_table "class_schedules_customers", id: false, force: :cascade do |t|
    t.integer "customer_id",                       null: false
    t.integer "class_schedule_id",                 null: false
    t.boolean "is_paid",           default: false
    t.index ["class_schedule_id", "customer_id"], name: "index_class_schedule_id_customer_id", using: :btree
    t.index ["class_schedule_id"], name: "index_class_schedules_customers_on_class_schedule_id", using: :btree
    t.index ["customer_id", "class_schedule_id"], name: "index_customer_id_class_schedule_id", using: :btree
    t.index ["customer_id"], name: "index_class_schedules_customers_on_customer_id", using: :btree
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

  create_table "locations", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "address"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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

  add_foreign_key "class_schedules", "class_types"
  add_foreign_key "class_schedules", "locations"
  add_foreign_key "class_schedules", "users"
  add_foreign_key "class_schedules_customers", "class_schedules"
  add_foreign_key "class_schedules_customers", "customers"
  add_foreign_key "roles_users", "roles"
  add_foreign_key "roles_users", "users"
end
