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

ActiveRecord::Schema.define(version: 2019_04_29_054148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "enabler_id"
    t.index ["enabler_id"], name: "index_comments_on_enabler_id"
  end

  create_table "enablers", force: :cascade do |t|
    t.float "pledged_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "perk_id"
    t.bigint "project_id"
    t.bigint "user_id"
    t.index ["perk_id"], name: "index_enablers_on_perk_id"
    t.index ["project_id"], name: "index_enablers_on_project_id"
    t.index ["user_id"], name: "index_enablers_on_user_id"
  end

  create_table "perks", force: :cascade do |t|
    t.integer "minimum_amount"
    t.boolean "unlimited"
    t.integer "enablr_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.index ["project_id"], name: "index_perks_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "hardware"
    t.integer "current_amount"
    t.integer "target_amount"
    t.string "target_date"
    t.string "category"
    t.string "country"
    t.string "city"
    t.integer "backer_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "fundraiser"
    t.string "country"
    t.string "city"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "enablers"
  add_foreign_key "enablers", "perks"
  add_foreign_key "enablers", "projects"
  add_foreign_key "enablers", "users"
  add_foreign_key "perks", "projects"
  add_foreign_key "projects", "users"
end
