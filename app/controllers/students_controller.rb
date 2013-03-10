#!/bin/env ruby
# encoding: utf-8

class StudentsController < ApplicationController
	include ExcelHelper

  IMPORT_PATH = "#{Dir.pwd}/lib/assets/students/"

	def import_all
		
    Student.delete_all
		excels = load_excels_by_path(IMPORT_PATH)

		excels.each do |filename, excel|
			(excel.first_row + 1).upto(excel.last_row) do |i|
				add_record(excel, i)
			end
		end

  end

  def import
    excels = load_excels_by_path(IMPORT_PATH)
    excel = excels.values[params[:id].to_i]

    (excel.first_row + 1).upto(excel.last_row) do |i|
      add_record(excel, i)
    end

    @excel_filename = File.basename(excels.keys[params[:id].to_i])
  end

  def delete
    
    excels = load_excels_by_path(IMPORT_PATH)
    excel = excels.values[params[:id].to_i]

    year = excel.cell(2, 'A').scan(/\d+/).first.to_i
    semester = excel.cell(2, 'A').scan(/\d+/).last.to_i

    Student.delete_all("year = #{year} AND semester = #{semester}")

    @excel_filename = File.basename(excels.keys[params[:id].to_i])
  end

  def delete_all
    Student.delete_all
  end

  def index
  	@students = Student.all.sort! { |student1, student2| [student1.year, student1.semester] <=> [student2.year, student2.semester]}
  end

  def show
  end


  def add_record (excel_record, line)

  	student = Student.new 
  	student.year = excel_record.cell(line, 1).scan(/\d+/).first.to_i
  	student.semester = excel_record.cell(line, 1).scan(/\d+/).last.to_i
  	student.id_number = excel_record.cell(line, 2)
  	student.birthdate = excel_record.cell(line, 3)
  	student.city = excel_record.cell(line, 4)
  	student.gender = excel_record.cell(line, 5)
  	student.coordinated_grade = excel_record.cell(line, 10)
  	student.integrated_grade = excel_record.cell(line, 11)
  	student.sat_grade = excel_record.cell(line, 12)
  	student.mehina_grade = excel_record.cell(line, 13)
  	student.english_level = excel_record.cell(line, 14)
  	student.school_grade = excel_record.cell(line, 15)
  	student.subject1_grade = excel_record.cell(line, 16)
  	student.subject1_units = excel_record.cell(line, 17)
  	student.subject2_grade = excel_record.cell(line, 18)
  	student.subject2_units = excel_record.cell(line, 19)
  	student.group_description = excel_record.cell(line, 20)
    student.priority = excel_record.cell(line, 21)
  	student.school = excel_record.cell(line, 22)
    student.curriculum = excel_record.cell(line, 23)
  	student.mazat = excel_record.cell(line, 24)
  	student.save

  	return student
  end

end