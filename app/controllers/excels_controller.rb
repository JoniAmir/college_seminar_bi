<<<<<<< HEAD
=======
require 'iconv'
require 'rubygems'
require 'roo'
>>>>>>> 59b2a06e27045f22669a6eae16dfadc0addaec36

class ExcelsController < ApplicationController
	include ExcelHelper

	IMPORT_PATH = "#{Dir.pwd}/lib/assets/"

	def show
		
		@typed_excels = load_excels_by_path(IMPORT_PATH + params[:type])
		@excel = @typed_excels.values[params[:id].to_i]
		@excel_filename = File.basename(@typed_excels.keys[params[:id].to_i])

	end


	def index
		@students_excels = load_excels_by_path(StudentsController::IMPORT_PATH)
		@graduates_excels = load_excels_by_path(GraduatesController::IMPORT_PATH)
		@graduates_professions_excels = load_excels_by_path(GraduateProfessionsController::IMPORT_PATH)
	end



end