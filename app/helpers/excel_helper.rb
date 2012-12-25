module ExcelHelper


	def load_students_excels

		excel_files = get_students_filenames
		excels = Hash.new

		# Load excels to list
		excel_files.each do |filename|
			excel = Excel.new("#{filename}")
			excel.default_sheet = excel.sheets.first			
			excels[filename] = excel
		end
		return excels

	end

	def get_students_filenames
		# set files info
		files_dir = "#{Dir.pwd}/lib/assets/students/"
		files_type = ".xls"

		# Get all files in dir
		return Dir.glob("#{files_dir}*#{files_type}").sort
	end



end
