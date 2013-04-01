module NomineesHelper
	
	def self.get_list_by_field_students(field_name)
		rows = StudentsLookup.where('field_name = ? and display_name != \'unknown\'', field_name).order('display_name')
  	res = rows.map do |option|
    		[option.display_name, option.numeric_value]
    end
  end

  def self.get_tag_by_code_students(field_name, code, tag_name)
    StudentsLookup.where("field_name = ? and numeric_value = ?", field_name, code).select("substr(tags,locate('" + tag_name + "=', tags) + length('" + tag_name + "='), locate(';', tags,locate('" + tag_name + "=', tags)) - (locate('" + tag_name + "=', tags) + length('" + tag_name + "=')) ) as val").first.val
  end

  def self.get_tag_by_code_regressions(field_name, code, tag_name)
    RegressionsLookup.where("field_name = ? and id = ?", field_name, code).select("substr(tags,locate('" + tag_name + "=', tags) + length('" + tag_name + "='), locate(';', tags,locate('" + tag_name + "=', tags)) - (locate('" + tag_name + "=', tags) + length('" + tag_name + "=')) ) as val").first.var_value
  end

  def self.get_dispaly_by_code_regressions(field_name, code)
    RegressionsLookup.where("field_name = ? and id = ?", field_name, code).first.display_name
  end

  def self.get_field_value(checked_nominee, var_code)
    var_display = self.get_dispaly_by_code_regressions("variable", var_code)
    var_value = 0;
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

    return var_value.to_i
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

  	return y
  end

  def self.calc_graphs(query_code)
    school_rows = RegressionGraph.where(school_code: school_code)

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

      return y

  end

end
