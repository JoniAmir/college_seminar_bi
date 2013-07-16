#encoding: utf-8

module NomineesHelper
	
	def self.get_list_by_field_students(field_name)
		rows = StudentsLookup.where('field_name = ? and display_name != \'unknown\'', field_name).order('display_name')
  	rows.map { |option| [option.display_name, option.numeric_value] }
  end

  def self.get_tag_by_code_students(field_name, code, tag_name)
    res = StudentsLookup.where("field_name = ? and numeric_value = ?", field_name, code).select(:tags).first
    res.tags.match(/#{tag_name}=([a-zA-Z0-9_]*){1};/)[1]
  end

  def self.get_tag_by_code_regressions(field_name, code, tag_name)
    res = RegressionsLookup.where("field_name = ? and id = ?", field_name, code).select(:tags).first
    res.tags.match(/#{tag_name}=([a-zA-Z0-9_]*){1};/)[1] if res.present?
  end

  def self.get_display_by_code_regressions(field_name, code)
    RegressionsLookup.where("field_name = ? and id = ?", field_name, code).first.display_name
  end

  def self.get_field_value(checked_nominee, var_code)
    var_display = self.get_display_by_code_regressions("variable", var_code)
    
    case var_display 
    when "start_studying_age"   
      var_value = checked_nominee.age
    when "is_male"  
      var_value = NomineesHelper::get_tag_by_code_students("gender", checked_nominee.gender_code, "is_male").to_i
    when "is_a_city"
      var_value = NomineesHelper::get_tag_by_code_students("city", checked_nominee.city_code, "is_a_city").to_i
    when "school_grade"
      var_value = checked_nominee.school_grade
    when "sat_grade" 
      var_value = checked_nominee.sat_grade
    when "integrated_grade"  
      var_value = (checked_nominee.sat_grade + 10 * (checked_nominee.school_grade-30))/2
    when "subject1_grade"  
      var_value = checked_nominee.math_grade
    when "subject1_units"  
      var_value = checked_nominee.math_units
    when "subject2_grade"  
      var_value = checked_nominee.english_grade
    when "subject2_units"  
      var_value = checked_nominee.english_units
    when "english_level"  
      var_value = checked_nominee.english_level
    when "is_working"  
      var_value = checked_nominee.is_working
    when "starting_semester"  
      var_value = checked_nominee.starting_semester
    else
      var_value = 0
    end

    var_value.to_i
  end


  def self.calc_formula(checked_nominee, query_code, regression_type_code)
  	query_vars = RegressionFormula.where(query_code: query_code)
  	y = 0
  	query_vars.each do |var|
  	  if (var.var_code.present?)
  	    field_value = get_field_value(checked_nominee, var.var_code)
  	    y += (field_value * var.var_coefficient) 
  	  else
  	    y += var.var_coefficient
  	  end
  	end

  	# Calc logistic regression
  	if (regression_type_code == 9)
  	  y = 1/(1+Math.exp(-y))
  	end

  	y
  end

  def self.calc_graphs(query_code)
    query_vars = RegressionFormula.where(query_code: query_code)
    y = 0
    query_vars.each do |var|
      if var.var_code.present?
        field_value = get_field_value(checked_nominee, var.var_code)
        y += (field_value * var.var_coefficient) 
      else
        y += var.var_coefficient
      end
    end

    # Calc logistic regression
    if regression_type_code == 9
      y = 1/(1+Math.exp(-y))
    end

    return y  
  end

  # Getting the data for the 1st graph. 
  def self.nominee_chart_data_linear(nominee, graph_query_code)
    # factors as in: ax + b
    a_factor = RegressionGraph.where("query_code = ? AND var_code IS NOT NULL", graph_query_code).first
    b_factor = RegressionGraph.where("query_code = ? AND var_code IS NULL", graph_query_code).first
    
    x_min = get_tag_by_code_regressions("variable", a_factor.var_code, "min_display").to_i
    x_max = get_tag_by_code_regressions("variable", a_factor.var_code, "max_display").to_i

    res = []
    res << [x_min, a_factor.var_coefficient * x_min + b_factor.var_coefficient]
    res << [x_max, a_factor.var_coefficient * x_max + b_factor.var_coefficient]

    return res
  end

  # Getting data for the dots chart - the rest of the students
  def self.nominee_chart_data_dots_observations(school_code, x_axis_field, y_axis_field)
    where = "#{x_axis_field} IS NOT NULL AND #{y_axis_field} IS NOT NULL AND graduation_school_code IS NOT NULL AND graduation_school_code = ?"
    select = "#{x_axis_field},#{y_axis_field}"
    rows = StatRow.where(where, school_code).select(select)

    rows.map { |r| [r[x_axis_field].to_f, r[y_axis_field].to_f] }
  end

  # Getting data for the dots chart - the obseravtion (one dot)
  def self.nominee_chart_data_dots_single(nominee, x_axis_field, graph_query_code)
    x_value = self.get_field_value(nominee, x_axis_field).to_f
    a_factor = RegressionGraph.where("query_code = ? AND var_code IS NOT NULL", graph_query_code).first
    b_factor = RegressionGraph.where("query_code = ? AND var_code IS NULL", graph_query_code).first

    [x_value, a_factor.var_coefficient * x_value + b_factor.var_coefficient]
  end

  def self.format_degree_duration(length)
    case length
    when 1..3
      return "עד 3 שנים"  
    when 3.01..4
      return "עד 4 שנים"  
    when 4.01..100
      return "מעל 4 שנים" 
    else
     return ""
    end 
  end
end
