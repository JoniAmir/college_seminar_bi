module StatRowsHelper

  GROUP_SIZE = 5

	# Chart 1
  def self.grades_range	
		select = "final_grade - (final_grade % #{GROUP_SIZE}) as finali_grade, count(*) as students_count"
    where  = 'final_grade is not null'
    group  = "final_grade - (final_grade % #{GROUP_SIZE})"
    rows = StatRow.where(where).group(group).select(select)
    
    res = rows.map do |grade_range|
      range = "#{grade_range.finali_grade.to_i} - #{grade_range.finali_grade.to_i + 5}"
      [range, grade_range.students_count.to_i]
   	end
    
    self.complete_grade_range(Hash[res])
  end

  # Chart 2
  def self.beginners_by_period
    rows = StatRow.group("year").select("year, count(*) as amount").order("year asc")
    rows.map { |row| [row.year, row.amount.to_i] }
  end

  # Chart 2
  def self.graduates_by_period
		select = "date_part('year', graduation_date) as year, count(*) as amount"
    where  = "graduation_date is not null AND date_part('year', graduation_date) between 2006 and 2011"
    group  = "date_part('year', graduation_date)"
    order  = "date_part('year', graduation_date) asc"
    rows = StatRow.where(where).group(group).select(select).order(order)
    
    rows.map { |row| [row.year.to_i, row.amount.to_i] }
  end

  # Chart 3
  def self.grade_combination(school_code)
  	select = "integrated_grade, final_grade"
    where  = "final_grade IS NOT NULL AND integrated_grade IS NOT NULL AND graduation_school_code = ?"
    rows = StatRow.where(where, school_code).select(select)

    rows.map { |row| [row.integrated_grade.to_f, row.final_grade.to_i] }
  end

  # Chart 4
  def self.job_level
  	select = "job_level, job_level_code, count(*) as amount"
    where  = "job_level_code is not null and work_in_profession is not null and job_level_code != 6"
    group  = "job_level,job_level_code"
    order  = "job_level_code"
    rows = StatRow.where(where).group(group).select(select).order(order)
  	
    rows.map { |row| [row.job_level, row.amount.to_i] }
  end

  # Chart 4
  def self.working_in_subject
  	select = "job_level, job_level_code, work_in_profession, count(*) as amount"
    where  = "job_level_code is not null and work_in_profession is not null and job_level_code != 6"
    group  = "job_level,job_level_code, work_in_profession"
    order  = "job_level_code, work_in_profession"
    rows = StatRow.where(where).group(group).select(select).order(order)
  
  	rows.map { |row| [row.work_in_profession.to_i, row.amount.to_i, row.job_level_code.to_i] }
  end  

  # Chart 5 - Column chart
  def self.grades_by_range(range_start)
    select = "graduation_school_code, COUNT(*) AS students_count"
    where  = "final_grade IS NOT NULL AND final_grade >= ? AND final_grade < ? AND graduation_school_code IS NOT NULL"
    group  = "graduation_school_code"
    order  = "graduation_school_code"
    rows = StatRow.where(where, range_start ,range_start + 5).group(group).select(select).order(order)

    res = { 1 => 0, 2 => 0, 3 => 0, 4 => 0 }
    rows.each { |r| res[r.graduation_school_code.to_i] = r.students_count.to_i }

    res.keys.map { |i| res[i] }
  end

  # Chart 6 - Column chart
  def self.grades_by_school(school_code)
    select = "final_grade - (final_grade % #{GROUP_SIZE}) as finali_grade, count(*) AS students_count"
    where  = "final_grade IS NOT NULL AND graduation_school_code = ?"
    group  = "final_grade - (final_grade % #{GROUP_SIZE})"
    rows = StatRow.where(where, school_code).group(group).select(select)

    temp = rows.map do |grade_range|
      range = "#{grade_range.finali_grade} - #{grade_range.finali_grade.to_i + 5}"
      [range.to_s, grade_range.students_count.to_i]
    end 

    self.complete_grade_range(Hash[temp]).map { |s| s[1] }
  end


  protected

  def self.complete_grade_range(ranges)    
    (65..95).step(5).map { |i| ranges["#{i} - #{i+5}"] ||= 0 }
    ranges.sort
  end

end

