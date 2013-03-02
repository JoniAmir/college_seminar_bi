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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130302155201) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "graduate_professions", :force => true do |t|
    t.integer  "id_number"
    t.string   "gender"
    t.string   "marital_status"
    t.integer  "number_of_children"
    t.string   "second_degree_institute"
    t.string   "second_degree_years"
    t.string   "second_degree_type"
    t.string   "third_degree_institute"
    t.string   "third_degree_years"
    t.string   "third_degree_type"
    t.string   "current_job"
    t.string   "current_company"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "graduates", :force => true do |t|
    t.integer  "id_number"
    t.string   "curriculum"
    t.integer  "curriculum_code"
    t.date     "graduation_ceremony_date"
    t.date     "graduation_date"
    t.integer  "final_grade"
    t.integer  "ranking"
    t.integer  "ranking_total"
    t.string   "gender"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "gender_code"
  end

  create_table "nominees", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "age"
    t.string   "city"
    t.integer  "school_grade"
    t.integer  "math_units"
    t.integer  "math_grade"
    t.integer  "sat_grade"
    t.string   "last_result_graphs"
    t.integer  "english_units"
    t.integer  "english_grade"
  end

  create_table "students", :force => true do |t|
    t.integer  "year"
    t.integer  "semester"
    t.integer  "id_number"
    t.date     "birthdate"
    t.string   "city"
    t.string   "gender"
    t.float    "coordinated_grade"
    t.string   "integrated_grade"
    t.integer  "sat_grade"
    t.float    "mehina_grade"
    t.integer  "english_level"
    t.float    "school_grade"
    t.float    "subject1_grade"
    t.integer  "subject1_units"
    t.float    "subject2_grade"
    t.integer  "subject2_units"
    t.string   "group_description"
    t.integer  "priority"
    t.string   "school"
    t.string   "curriculum"
    t.integer  "mazat"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "curriculum_code"
    t.integer  "mazat_code"
    t.string   "mazat_display"
    t.integer  "gender_code"
    t.integer  "group_description_code"
    t.integer  "school_code"
  end

end
