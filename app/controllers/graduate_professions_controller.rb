#!/bin/env ruby
# encoding: utf-8

class GraduateProfessionsController < ApplicationController
include ExcelHelper

  IMPORT_PATH = "#{Dir.pwd}/lib/assets/graduates_professions/"

  def import
    excels = load_excels_by_path(IMPORT_PATH)
    excel = excels.values[params[:id].to_i]

    (excel.first_row + 1).upto(excel.last_row) do |i|
      add_record(excel, i)
    end
  end

  def delete_all
    GraduateProfession.delete_all()
  end

  def add_record (excel_record, line)

    graduate_profession = GraduateProfession.new 
    graduate_profession.id_number = excel_record.cell(line, 1)
    graduate_profession.gender = excel_record.cell(line, 2)
    graduate_profession.marital_status = excel_record.cell(line, 3)
    graduate_profession.number_of_children = excel_record.cell(line, 4)
    graduate_profession.second_degree_institute = excel_record.cell(line, 5)
    graduate_profession.second_degree_years = excel_record.cell(line, 6)
    graduate_profession.second_degree_type = excel_record.cell(line, 7)
    graduate_profession.third_degree_institute = excel_record.cell(line, 8)
    graduate_profession.third_degree_years = excel_record.cell(line, 9)
    graduate_profession.third_degree_type = excel_record.cell(line, 10)
    graduate_profession.current_job = excel_record.cell(line, 11)
    graduate_profession.current_company = excel_record.cell(line, 12)
    graduate_profession.save

    return graduate_profession
  end

  def index
    @graduates_professions = GraduateProfession.all
  end

  def show
    @graduate_profession = GraduateProfession.find(params[:id])
  end
end
