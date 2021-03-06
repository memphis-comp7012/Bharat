# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160501204003) do

  create_table "contributions", force: :cascade do |t|
    t.integer  "score"
    t.integer  "money_received"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "contributions", ["project_id"], name: "index_contributions_on_project_id"
  add_index "contributions", ["user_id"], name: "index_contributions_on_user_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "iterations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  add_index "iterations", ["project_id"], name: "index_iterations_on_project_id"

  create_table "profile_research_fields", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "profile_id"
    t.integer  "research_field_id"
  end

  add_index "profile_research_fields", ["profile_id"], name: "index_profile_research_fields_on_profile_id"
  add_index "profile_research_fields", ["research_field_id"], name: "index_profile_research_fields_on_research_field_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.integer  "education_level"
    t.integer  "phone_number",        limit: 8
    t.text     "summary_of_projects"
    t.text     "skills"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "department_id"
  end

  add_index "profiles", ["department_id"], name: "index_profiles_on_department_id"

  create_table "project_research_fields", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "project_id"
    t.integer  "research_field_id"
  end

  add_index "project_research_fields", ["project_id"], name: "index_project_research_fields_on_project_id"
  add_index "project_research_fields", ["research_field_id"], name: "index_project_research_fields_on_research_field_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "status"
    t.string   "description"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "funding",          precision: 10, scale: 2
    t.integer  "difficulty_level"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "department_id"
    t.integer  "user_id"
  end

  add_index "projects", ["department_id"], name: "index_projects_on_department_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "requests", force: :cascade do |t|
    t.integer  "type"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "requests", ["project_id"], name: "index_requests_on_project_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "research_fields", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
  end

  add_index "research_fields", ["department_id"], name: "index_research_fields_on_department_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.integer  "assigned_user"
    t.date     "due_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "iteration_id"
  end

  add_index "tasks", ["iteration_id"], name: "index_tasks_on_iteration_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.integer  "user_id"
  end

  add_index "teams", ["project_id"], name: "index_teams_on_project_id"
  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "profile_id"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["profile_id"], name: "index_users_on_profile_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
