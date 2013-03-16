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

ActiveRecord::Schema.define(:version => 20130316181132) do

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

  create_table "all_info", :id => false, :force => true do |t|
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
    t.integer "is_a_graduate"
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
    t.integer "job_level"
    t.string  "current_company",              :limit => 45
  end

  create_table "all_infos", :force => true do |t|
    t.integer  "year"
    t.integer  "semester"
    t.integer  "id_number"
    t.date     "birthdate"
    t.integer  "age"
    t.string   "city"
    t.integer  "city_code"
    t.integer  "is_a_city"
    t.string   "gender"
    t.integer  "gender_code"
    t.integer  "is_male"
    t.integer  "coordinated_grade"
    t.integer  "integrated_grade"
    t.integer  "sat_grade"
    t.integer  "mehina_grade"
    t.integer  "english_level"
    t.integer  "school_grade"
    t.integer  "subject1_grade"
    t.string   "subject1_units"
    t.integer  "subject2_grade"
    t.integer  "subject2_units"
    t.string   "group_description"
    t.integer  "group_description_code"
    t.integer  "is_working"
    t.string   "fp_school"
    t.integer  "fp_school_code"
    t.string   "sp_school"
    t.integer  "sp_school_code"
    t.string   "tp_school"
    t.integer  "tp_school_code"
    t.string   "fp_curriculum"
    t.integer  "fp_curriculum_code"
    t.string   "sp_curriculum"
    t.integer  "sp_curriculum_code"
    t.string   "tp_curriculum"
    t.integer  "tp_curriculum_code"
    t.integer  "fp_mazat_code"
    t.string   "fp_mazat_display"
    t.integer  "sp_mazat_code"
    t.string   "sp_mazat_display"
    t.integer  "tp_mazat_code"
    t.string   "tp_mazat_display"
    t.integer  "starting_semester"
    t.integer  "droped_out"
    t.integer  "did_start"
    t.integer  "is_a_graduate"
    t.date     "graduation_ceremony_date"
    t.date     "graduation_date"
    t.integer  "final_grade"
    t.string   "graduation_school"
    t.integer  "graduation_school_code"
    t.string   "g_curriculum"
    t.integer  "g_curriculum_code"
    t.integer  "ranking"
    t.integer  "ranking_total"
    t.integer  "graduatep_gender_code"
    t.string   "graduatep_gender"
    t.integer  "marital_status_code"
    t.string   "marital_status"
    t.integer  "number_of_children"
    t.integer  "second_degree_institute_code"
    t.string   "second_degree_institute"
    t.integer  "second_degree_start_year"
    t.integer  "second_degree_end_year"
    t.integer  "second_degree_type_code"
    t.string   "second_degree_type"
    t.integer  "third_degree_institute_code"
    t.string   "third_degree_institute"
    t.integer  "third_degree_start_year"
    t.integer  "third_degree_end_year"
    t.integer  "third_degree_type_code"
    t.string   "third_degree_type"
    t.string   "current_job"
    t.integer  "job_level"
    t.string   "current_company"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

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

  create_table "graduates_lookup", :force => true do |t|
    t.string  "field_name"
    t.integer "numeric_value"
    t.string  "display_name"
  end

  add_index "graduates_lookup", ["numeric_value"], :name => "NUMERIC_IDX"

  create_table "graduates_professions", :primary_key => "ID", :force => true do |t|
    t.integer "id_number"
    t.integer "gender_code"
    t.string  "gender",                       :limit => 45
    t.integer "marital_status_code"
    t.string  "marital_status",               :limit => 45
    t.integer "number_of_children"
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
    t.string  "current_company",              :limit => 45
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

  create_table "sequence_data", :primary_key => "sequence_name", :force => true do |t|
    t.integer "sequence_increment",              :default => 1,                    :null => false
    t.integer "sequence_min_value",              :default => 1,                    :null => false
    t.integer "sequence_max_value", :limit => 8, :default => 18446744073709551615, :null => false
    t.integer "sequence_cur_value", :limit => 8, :default => 1
    t.boolean "sequence_cycle",                  :default => false,                :null => false
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
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "gender_code"
    t.integer  "curriculum_code"
    t.integer  "mazat_code"
    t.string   "mazat_display"
  end

  create_table "students_final", :id => false, :force => true do |t|
    t.integer "id",                                  :default => 0, :null => false
    t.integer "year"
    t.integer "semester"
    t.integer "id_number"
    t.date    "birthdate"
    t.string  "city"
    t.integer "city_code",              :limit => 8
    t.string  "gender"
    t.integer "gender_code",            :limit => 8
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
    t.integer "group_description_code", :limit => 8
    t.integer "priority"
    t.string  "school"
    t.integer "school_code",            :limit => 8
    t.string  "curriculum"
    t.integer "curriculum_code",        :limit => 8
    t.integer "mazat"
    t.integer "mazat_code",             :limit => 8
    t.string  "mazat_display"
  end

  create_table "students_lookup", :force => true do |t|
    t.string  "field_name"
    t.integer "numeric_value"
    t.string  "display_name"
  end

  add_index "students_lookup", ["numeric_value"], :name => "NUMERIC_IDX"

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

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
