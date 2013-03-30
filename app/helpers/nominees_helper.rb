module NomineesHelper
	
	def self.get_list_by_field(field_name)
  	
		rows = StudentsLookup.where('field_name = ? and display_name != \'unknown\'', field_name).order('display_name')
    	res = rows.map do |option|
      		[option.display_name, option.numeric_value]
      	end
   	end
end
