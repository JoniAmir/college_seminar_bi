require 'rubygems'
require 'roo'

class ExcelController < ApplicationController
	include ExcelHelper

	IMPORT_PATH = "#{Dir.pwd}/lib/assets/"

	def show
		
		@typed_excels = load_excels_by_path(IMPORT_PATH + params[:type])
		@excel = @typed_excels.values[params[:id].to_i]
		@excel_filename = File.basename(@typed_excels.keys[params[:id].to_i])

	end


	def index
		@students_excels = load_excels_by_path(StudentController::IMPORT_PATH)
		@graduates_excels = load_excels_by_path(GraduateController::IMPORT_PATH)
		@graduates_professions_excels = load_excels_by_path(GraduateProfessionController::IMPORT_PATH)
	end



end