
module ExcelHelper

	def load_excels_by_path(directory)

		excel_files = get_filenames_by_path(directory)
		excels = Hash.new		

		# Load excels to list
		excel_files.each do |filename|
			excel = Roo::Excel.new("#{filename}")
			excel.default_sheet = excel.sheets.first
			excels[filename] = excel
		end

		return excels

	end

	def load_excel_by_path(directory)

		excel = Excel.new("#{directory}")
		excel.default_sheet = excel.sheets.first

		return(excel)
	end

	def get_filenames_by_path(directory)
		# set files info
		files_dir = directory
		files_type = ".xls"

		# Get all files in dir
		return Dir.glob("#{files_dir}**/*#{files_type}").sort
	end



end
