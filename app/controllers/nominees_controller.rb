class NomineesController < ApplicationController
  before_filter :require_login, :only => [:new, :show, :create]
  
  def show
    @nominee = Nominee.find(params[:id])
    
    # Generate box results
    @nominee_boxes = []
    query_codes = RegressionFormula.where(school_code: @nominee.school_code).select("distinct query_code, regression_type_code, question, correlation_coefficient")
    query_codes.each do |f|
      y = NomineesHelper::calc_formula(@nominee, f.query_code, f.regression_type_code).round(2)
      r = f.correlation_coefficient
      y_formatted = (y * 100).to_s + "%" if (f.regression_type_code == 9)
      @nominee_boxes << [f.question, y_formatted || y.to_s, r]
    end

    # Generate charts
    @nominee_charts = []
    graph_rows = RegressionGraph.where('school_code = ? AND var_code is not null', @nominee.school_code)
    graph_rows.each do |g|
      chart = Hash.new
      chart[:x_axis] = NomineesHelper::get_display_by_code_regressions("variable", g.var_code)
      chart[:y_axis] = g.question 
      chart[:title] = chart[:y_axis] + "  " + chart[:x_axis]      
      chart[:data_linear] = NomineesHelper.nominee_chart_data_linear(@nominee, g.query_code)
      chart[:data_dots_obs] = NomineesHelper.nominee_chart_data_dots_observations(@nominee.school_code, chart[:x_axis], "final_grade")
      chart[:data_dots_ind] = NomineesHelper.nominee_chart_data_dots_single(@nominee, g.var_code, g.query_code)
      @nominee_charts << chart
    end
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
