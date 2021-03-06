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

ActiveRecord::Schema.define(version: 20171004224223) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "health_cares", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "health_cares_patients", force: :cascade do |t|
    t.string   "affiliate_no"
    t.integer  "health_care_id"
    t.integer  "patient_id"
    t.boolean  "active",         default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["health_care_id"], name: "index_health_cares_patients_on_health_care_id"
    t.index ["patient_id"], name: "index_health_cares_patients_on_patient_id"
  end

  create_table "medical_order_items", force: :cascade do |t|
    t.integer  "medical_order_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "medical_test_id"
    t.string   "value"
    t.index ["medical_order_id"], name: "index_medical_order_items_on_medical_order_id"
  end

  create_table "medical_orders", force: :cascade do |t|
    t.integer  "health_care_id"
    t.integer  "patient_id"
    t.string   "doctor_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["health_care_id"], name: "index_medical_orders_on_health_care_id"
    t.index ["patient_id"], name: "index_medical_orders_on_patient_id"
  end

  create_table "medical_tests", force: :cascade do |t|
    t.string   "name"
    t.text     "recomendations"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "unit"
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "surname"
    t.string   "phone"
    t.string   "address"
    t.string   "dni"
    t.string   "cuil"
    t.string   "cuit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
