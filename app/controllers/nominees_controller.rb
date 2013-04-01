class NomineesController < ApplicationController
  before_filter :require_login, :only => [:new, :show, :create]
  
  def show
    @graph_count = 1 #NomineesHelper::get_graph_count(params[:id])
    @nominee = Nominee.find(params[:id])
    @nominee_predictions = []

    # Generate box results
    query_codes = RegressionFormula.where(school_code: @nominee.school_code).select("distinct query_code, regression_type_code, question, correlation_coefficient")
    query_codes.each do |f|
      y = NomineesHelper::calc_formula(@nominee, f.query_code, f.regression_type_code).round(2)
      r = f.correlation_coefficient
      if (f.regression_type_code == 9)
        y_formatted = (y * 100).to_s + "%" 
      else
        y_formatted = y
      end
      @nominee_predictions << [f.question, y_formatted, r]
    end

    # Generate charts

  end

  # GET /nominees/new
  def new
    @nominee = Nominee.new
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
