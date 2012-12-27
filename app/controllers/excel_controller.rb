require 'rubygems'
require 'roo'
#lital remark


class ExcelController < ApplicationController
	include ExcelHelper

	def show

		@excels = load_students_excels #change
		@excel = @excels.values[params[:id].to_i]
		@excel_filename = File.basename(@excels.keys[params[:id].to_i])

	end


	def index

		@excels = load_students_excels

	end

end



# yoni remark
