module StatRowsHelper

	@rows = StatRow.all

	# Graph grades_range_chart
  def self.grades_range
  	
  	group_size = 5
		rows = StatRow.where('final_grade is not null').group("final_grade - (final_grade % #{group_size})").select("final_grade - (final_grade % #{group_size}) as finali_grade, count(*) as students_count")
    rows.map do |grade_range|
      range = grade_range.finali_grade.to_s + "-" + (grade_range.finali_grade + 5).to_s
      [range, grade_range.students_count.to_i]
   	end
  end

  # Graph graduates_by_year_chart
  def self.graduates_by_period
		rows = StatRow.where('graduation_date is not null').group("YEAR(graduation_date)").select("YEAR(graduation_date) as year, count(*) as amount")
    rows.map do |row|
      [row.year, row.amount]
   	end
  end

  #Graph graduates_by_year_chart
  def self.beginners_by_period
  	rows = StatRow.group("year").select("year, count(*) as amount")
    rows.map do |row|
      [row.year, row.amount]
   	end
  end

  # Graph grades_dots_chart
  def self.grade_combination(school_code)
  	rows = StatRow.where('final_grade is not null AND integrated_grade is not null AND graduation_school_code = ?', school_code).select("integrated_grade, final_grade")
    rows.map do |row|
      [row.integrated_grade.to_f, row.final_grade]
   	end
  end


  def self.job_level
  	rows = StatRow.where("job_level is not null and work_in_profession is not null").group("job_level").select("job_level, count(*) as amount")
  	rows.map do |row|
      [row.job_level.to_i, row.amount.to_i]
   	end
  end

  def self.working_in_subject
  	rows = StatRow.where("job_level is not null and work_in_profession is not null").group("job_level, work_in_profession").select("job_level, work_in_profession, count(*) as amount").order("job_level, work_in_profession")
  	rows.map do |row|
      [(row.work_in_profession.to_i == 0) ? "Yes" : "No", row.amount.to_i, row.job_level]
   	end
  end  



end