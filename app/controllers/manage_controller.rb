require 'rubygems'
require 'roo'



class ManageController < ApplicationController


	def import
		
		files_dir = "#{Dir.pwd}/lib/assets/students/"
		files_type = ".xls"

		# Get all files in dir
		@excel_files = Dir.glob("#{files_dir}*#{files_type}").sort

		@excels = []

		# Load excels to list
		@excel_files.each do |filename|
			logger.debug "adding excel: #{filename}"
			excel = Excel.new("#{filename}")
			excel.default_sheet = excel.sheets.first			
			@excels << excel
		end

		@excel = @excels[0]


	end

	def fix_file_names filenames

		# # Rename files
		# @excel_files.each do |filename|
		#     new_filename = filename.scan(/\d+/).first + files_type
		#     File.rename(filename, files_dir + new_filename)
		# end


	end

end
