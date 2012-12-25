require 'rubygems'
require 'roo'

class ExcelController < ApplicationController

	before_filter :import

	def import
		files_dir = "#{Dir.pwd}/lib/assets/students/"
		files_type = ".xls"

		# Get all files in dir
		@excel_files = Dir.glob("#{files_dir}*#{files_type}").sort
		@excels = []

		# Load excels to list
		@excel_files.each do |filename|
			excel = Excel.new("#{filename}")
			excel.default_sheet = excel.sheets.first			
			@excels << excel
		end
	end

	def show
		@excel = @excels[params[:id].to_i]
	end

end
