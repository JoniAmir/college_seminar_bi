module NomineesHelper
	
	def self.get_list_by_field(field_name)
  	
		rows = StudentsLookup.where('field_name = ? and display_name != \'unknown\'', field_name).order('display_name')
  	res = rows.map do |option|
    		[option.display_name, option.numeric_value]
    end
  end

  def self.get_field_value(var_code)
  	return 5
  end


  def self.calc_formula(query_code, regression_type_code)
  	query_vars = RegressionFormula.where(query_code: query_code)
  	y = 0
  	query_vars.each do |var|
  	  if (var.var_code.present?)
  	    field_value = get_field_value(var.var_code)
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
