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

ActiveRecord::Schema.define(:version => 20130105130855) do

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
    t.integer  "curriculum_id"
    t.date     "graduation_ceremony_date"
    t.date     "graduation_date"
    t.integer  "final_grade"
    t.integer  "ranking"
    t.integer  "ranking_total"
    t.string   "gender"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "students", :force => true do |t|
    t.integer  "year"
    t.integer  "semester"
    t.integer  "id_number"
    t.date     "birthdate"
    t.string   "city"
    t.string   "gender"
    t.string   "ba_degree"
    t.string   "ba_minor"
    t.float    "combined_grade"
    t.string   "institute"
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
  end

end
