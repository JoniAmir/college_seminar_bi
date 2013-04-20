module StatRowsHelper

	@rows = StatRow.all

	# Chart 1
  def self.grades_range
  	
  	group_size = 5
		rows = StatRow.where('final_grade is not null').group("final_grade - (final_grade % #{group_size})").select("final_grade - (final_grade % #{group_size}) as finali_grade, count(*) as students_count")
    res = rows.map do |grade_range|
      range = grade_range.finali_grade.to_s + "-" + (grade_range.finali_grade.to_i + 5).to_s
      [range, grade_range.students_count.to_i]
   	end
    
    self.complete_grade_range(Hash[res])
  end



  # Chart 2
  def self.beginners_by_period
    rows = StatRow.group("year").select("year, count(*) as amount")
    rows.map do |row|
      [row.year, row.amount.to_i]
    end
  end

  def self.graduates_by_period
		rows = StatRow.where("graduation_date is not null AND date_part('year', graduation_date) between 2006 and 2011").group("date_part('year', graduation_date)").select("date_part('year', graduation_date) as year, count(*) as amount")
    rows.map do |row|
      [row.year.to_i, row.amount.to_i]
   	end
  end



  # Chart 3
  def self.grade_combination(school_code)
  	rows = StatRow.where('final_grade is not null AND integrated_grade is not null AND graduation_school_code = ?', school_code).select("integrated_grade, final_grade")
    rows.map do |row|
      [row.integrated_grade.to_f, row.final_grade.to_i]
   	end
  end



  # Chart 4
  def self.job_level
  	rows = StatRow.where("job_level_code is not null and work_in_profession is not null and job_level_code != 6").group("job_level,job_level_code").select("job_level, job_level_code, count(*) as amount").order("job_level_code")
  	rows.map do |row|
      [row.job_level, row.amount.to_i]
   	end
  end

  def self.working_in_subject
  	rows = StatRow.where("job_level_code is not null and work_in_profession is not null and job_level_code != 6").group("job_level,job_level_code, work_in_profession").select("job_level, job_level_code, work_in_profession, count(*) as amount").order("job_level_code, work_in_profession")
  	rows.map do |row|
      [row.work_in_profession.to_i, row.amount.to_i, row.job_level_code.to_i]
   	end
  end  



  # Chart 5
  def self.grades_by_school(school_code)
    group_size = 5
    rows = StatRow.where('final_grade is not null AND graduation_school_code = ?', school_code).group("final_grade - (final_grade % #{group_size})").select("final_grade - (final_grade % #{group_size}) as finali_grade, count(*) as students_count")
    temp = rows.map do |grade_range|
      range = grade_range.finali_grade.to_s + "-" + (grade_range.finali_grade.to_i + 5).to_s
      [range.to_s, grade_range.students_count.to_i]
    end

    temp = self.complete_grade_range(Hash[temp])    
    res = []
    temp.map do |s|
      res << s[1]
    end
    res
  end

  def self.grades_by_range(range_start)
    rows = StatRow.where('final_grade is not null AND final_grade >= ? AND final_grade <= ?', range_start ,range_start + 5).group("graduation_school_code").select("graduation_school_code, count(*) as students_count").order("graduation_school_code")
    tmp = rows.map do |r|
      [r.graduation_school_code.to_i, r.students_count.to_i]
    end
    rows_hash = Hash[tmp]
    res = []
    (1..4).each do |i|
      res[i-1] = rows_hash[i] ||= 0
    end
    res
  end

  protected

  def self.complete_grade_range(ranges)    
    (65..95).step(5) do |i|
      range = i.to_s + "-" + (i+5).to_s
      ranges[range] = 0 if ranges[range].nil?
    end
    ranges.sort
  end

end