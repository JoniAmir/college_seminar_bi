class NomineesController < ApplicationController
  before_filter :require_login, :only => :new
  
  def show
    @nominee = Nominee.find(params[:id])
    @nominee_predictions = []

    query_codes = RegressionFormula.where(school_code: @nominee.school_code).select("distinct query_code, regression_type_code, question")
    query_codes.each do |f|
    
      y = NomineesHelper::calc_formula(f.query_code, f.regression_type_code)
      
      r = 0
      @nominee_predictions << [f.question, y, r]
    end


  end

  # GET /nominees/new
  def new
    @nominee = Nominee.new
  end

  # GET /nominees/1/edit
  def edit
    @nominee = Nominee.find(params[:id])
  end

  # POST /nominees
  # POST /nominees.json
  def create
    Rails.logger.error(params[:nominee])
    @nominee = Nominee.new(params[:nominee])

    # Get lookup values
    @nominee.city = StudentsLookup.where("field_name = 'city' and numeric_value = ? ", @nominee.city_code).first.display_name
    @nominee.gender = StudentsLookup.where("field_name = 'gender' and numeric_value = ? ", @nominee.gender_code).first.display_name
    @nominee.school = StudentsLookup.where("field_name = 'school' and numeric_value = ? ", @nominee.school_code).first.display_name
    
    if @nominee.save
      redirect_to @nominee, notice: 'Nominee was successfully created.'
    else
      render action: "new"
    end
  end

end
