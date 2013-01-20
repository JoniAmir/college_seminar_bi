#!/bin/env ruby
# encoding: utf-8

class GraduatesController < ApplicationController
  include ExcelHelper

  IMPORT_PATH = "#{Dir.pwd}/lib/assets/graduates/"

  def import
    excels = load_excels_by_path(IMPORT_PATH)
    excel = excels.values[params[:id].to_i]

    (excel.first_row + 1).upto(excel.last_row) do |i|
      add_record(excel, i)
    end
  end

  def delete_all
    Graduate.delete_all()
  end

  def add_record (excel_record, line)

    graduate = Graduate.new 
    graduate.id_number = excel_record.cell(line, 1)
    graduate.curriculum = excel_record.cell(line, 2)
    graduate.curriculum_id = excel_record.cell(line, 3)
    graduate.graduation_ceremony_date = if excel_record.cell(line, 4) != 0
                                         then (Date.parse(excel_record.cell(line, 4).to_i().to_s())) 
                                         else nil
                                        end
    graduate.graduation_date = if excel_record.cell(line, 5) != 0
                                         then (Date.parse(excel_record.cell(line, 5).to_i().to_s())) 
                                         else nil
                                        end
    graduate.final_grade = excel_record.cell(line, 6)
    graduate.ranking = excel_record.cell(line, 7)
    graduate.ranking_total = excel_record.cell(line, 8)
    graduate.gender = excel_record.cell(line, 9)
    graduate.save

    return graduate

  end

  def delete
    
  end

  def index
    @graduates = Graduate.all
  end

  def show
    @graduate = Graduate.find(params[:id])
  end

end
