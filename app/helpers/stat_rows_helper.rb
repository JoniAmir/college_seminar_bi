module StatRowsHelper

	# Graph grades_range_chart
  def self.grades_range
  	group_size = 5
		rows = StatRow.where(StatRow.arel_table[:final_grade].not_eq(nil)).group("final_grade - (final_grade % #{group_size})").select("final_grade - (final_grade % #{group_size}) as finali_grade, count(*) as students_count,avg(final_grade) as average_grade")
    rows.map do |grade_range|
      range = grade_range.finali_grade.to_s + "-" + (grade_range.finali_grade + 5).to_s
      [range, grade_range.students_count.to_i]
   	end
  end

  # Graph graduates_by_year_chart
  def self.graduates_by_period
		rows = StatRow.where(StatRow.arel_table[:graduation_date].not_eq(nil)).group("YEAR(graduation_date)").select("YEAR(graduation_date) as year, count(*) as amount")
    rows.map do |period|
      [period.year, period.amount]
   	end
  end

  #Graph graduates_by_year_chart
  def self.beginners_by_period
  	rows = StatRow.group("year").select("year, count(*) as amount")
    rows.map do |period|
      [period.year, period.amount]
   	end
  end

  # Graph grades_dots_chart
  def self.grade_combination(school_code)
  	rows = StatRow.group.where('final_grade is not null AND integrated_grade is not null AND graduation_school_code = ?', school_code).select("integrated_grade, final_grade")
    rows.map do |grades|
      [grades.integrated_grade.to_f, grades.final_grade]
   	end
  end  

end