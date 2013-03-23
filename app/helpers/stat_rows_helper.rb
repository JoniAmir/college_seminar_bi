module StatRowsHelper

  def self.grades_range_pie(stat_rows)
  	group_size = 5
		students_by_grade_range = StatRow.where(StatRow.arel_table[:final_grade].not_eq(nil)).group("final_grade - (final_grade % #{group_size})").select("final_grade - (final_grade % #{group_size}) as finali_grade, count(*) as students_count,avg(final_grade) as average_grade")

		# Get students count for each range
    students_by_grade_range.map do |grade_range|
      range = grade_range.finali_grade.to_s + " - " + (grade_range.finali_grade + 5).to_s
      [range, grade_range.students_count.to_i]
   	end
 
  end
end