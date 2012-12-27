class StudentController < ApplicationController
	include ExcelHelper

	def import

		Student.delete_all
		excels = load_students_excels

		excels.each do |filename, excel|
			logger.debug "started processing file #{filename}"
			(excel.first_row + 1).upto(excel.last_row) do |i|
				add_record(excel, i)
			end
			logger.debug "finished processing file #{filename}"
		end

	end

  def index
  	@students = Student.all


  	#@students = @students.select { |student| student.sat_grade && student.sat_grade > 0 }.sort_by { |a| a.sat_grade }
    #@students = @students.select { |student| student.city && student.city = "תל אביב-יפו" }

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
  	student.ba_degree = excel_record.cell(line, 6)
		student.ba_minor = excel_record.cell(line, 7)
  	student.combined_grade = excel_record.cell(line, 8)
  	student.institute = excel_record.cell(line, 9)
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
