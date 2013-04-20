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

ActiveRecord::Schema.define(:version => 20130331174003) do

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

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "active_admin_comments_1_idx"
  add_index "active_admin_comments", ["namespace"], :name => "active_admin_comments_namespace_idx"

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

  add_index "admin_users", ["email"], :name => "admin_users_email_key", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "admin_users_reset_password_token_key", :unique => true

  create_table "nominees", :force => true do |t|
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "age"
    t.string   "city"
    t.decimal  "school_grade",       :precision => 11, :scale => 0
    t.integer  "math_units"
    t.integer  "math_grade"
    t.integer  "sat_grade"
    t.string   "last_result_graphs"
    t.integer  "english_units"
    t.integer  "english_grade"
    t.integer  "city_code"
    t.integer  "gender_code"
    t.string   "gender"
    t.integer  "starting_semester"
    t.string   "school"
    t.integer  "school_code"
    t.integer  "is_working"
    t.integer  "english_level"
  end

  create_table "regression_formulas", :force => true do |t|
    t.integer "query_code"
    t.integer "question_code"
    t.string  "question"
    t.integer "regression_type_code"
    t.integer "school_code"
    t.integer "var_code"
    t.float   "var_coefficient"
    t.float   "correlation_coefficient"
  end

  create_table "regression_graphs", :force => true do |t|
    t.integer "query_code"
    t.integer "question_code"
    t.string  "question"
    t.integer "regression_type_code"
    t.integer "school_code"
    t.integer "var_code"
    t.float   "var_coefficient"
    t.float   "correlation_coefficient"
  end

  create_table "regressions_lookup", :force => true do |t|
    t.string "field_name",   :limit => 500
    t.string "display_name", :limit => 500
    t.string "tags"
  end

  create_table "stat_rows", :id => false, :force => true do |t|
    t.integer "year"
    t.integer "semester"
    t.integer "id_number"
    t.date    "birthdate"
    t.integer "age"
    t.string  "city"
    t.integer "city_code",                    :limit => 8
    t.integer "is_a_city"
    t.string  "gender",                       :limit => 1
    t.integer "gender_code"
    t.integer "is_male"
    t.float   "coordinated_grade"
    t.string  "integrated_grade"
    t.integer "sat_grade"
    t.float   "mehina_grade"
    t.integer "english_level"
    t.float   "school_grade"
    t.float   "subject1_grade"
    t.integer "subject1_units"
    t.float   "subject2_grade"
    t.integer "subject2_units"
    t.string  "group_description"
    t.integer "group_description_code",       :limit => 8
    t.integer "is_working"
    t.string  "fp_school"
    t.integer "fp_school_code"
    t.string  "sp_school"
    t.integer "sp_school_code"
    t.string  "tp_school"
    t.integer "tp_school_code"
    t.string  "fp_curriculum"
    t.integer "fp_curriculum_code"
    t.string  "sp_curriculum"
    t.integer "sp_curriculum_code"
    t.string  "tp_curriculum"
    t.integer "tp_curriculum_code"
    t.integer "fp_mazat_code"
    t.string  "fp_mazat_display",             :limit => 20
    t.integer "sp_mazat_code"
    t.string  "sp_mazat_display",             :limit => 20
    t.integer "tp_mazat_code"
    t.string  "tp_mazat_display",             :limit => 20
    t.integer "starting_semester"
    t.integer "droped_out"
    t.integer "did_start"
    t.date    "start_date"
    t.integer "start_studying_age"
    t.integer "is_a_graduate"
    t.decimal "degree_duration",                            :precision => 3, :scale => 2
    t.date    "graduation_ceremony_date"
    t.date    "graduation_date"
    t.integer "final_grade"
    t.string  "graduation_school",            :limit => 40
    t.integer "graduation_school_code"
    t.string  "g_curriculum"
    t.integer "g_curriculum_code"
    t.integer "ranking"
    t.integer "ranking_total"
    t.integer "graduatep_gender_code"
    t.string  "graduatep_gender",             :limit => 45
    t.integer "marital_status_code"
    t.string  "marital_status",               :limit => 45
    t.integer "number_of_children"
    t.integer "has_high_degree"
    t.integer "second_degree_institute_code"
    t.string  "second_degree_institute",      :limit => 45
    t.integer "second_degree_start_year"
    t.integer "second_degree_end_year"
    t.integer "second_degree_type_code"
    t.string  "second_degree_type",           :limit => 45
    t.integer "third_degree_institute_code"
    t.string  "third_degree_institute",       :limit => 45
    t.integer "third_degree_start_year"
    t.integer "third_degree_end_year"
    t.integer "third_degree_type_code"
    t.string  "third_degree_type",            :limit => 45
    t.string  "current_job",                  :limit => 45
    t.string  "job_level",                    :limit => 25
    t.integer "job_level_code"
    t.integer "is_manager"
    t.integer "is_high_manager"
    t.string  "current_company",              :limit => 45
    t.integer "work_in_profession"
  end

  create_table "students_lookup", :force => true do |t|
    t.string  "field_name"
    t.integer "numeric_value"
    t.string  "display_name"
    t.string  "tags"
  end

  add_index "students_lookup", ["numeric_value"], :name => "students_lookup_numeric_value_idx"

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["remember_me_token"], :name => "users_remember_me_token_idx"
  add_index "users", ["reset_password_token"], :name => "users_reset_password_token_idx"

end
