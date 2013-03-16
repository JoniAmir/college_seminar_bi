class NomineesController < ApplicationController
  before_filter :require_login, :only => :new
  
  # GET /nominees
  # GET /nominees.json
  def index
    @nominees = Nominee.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nominees }
    end
  end

  # GET /nominees/1
  # GET /nominees/1.json
  def show
    @nominee = Nominee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nominee }
    end
  end

  # GET /nominees/new
  # GET /nominees/new.json
  def new
    @nominee = Nominee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nominee }
    end
  end

  # GET /nominees/1/edit
  def edit
    @nominee = Nominee.find(params[:id])
  end

  # POST /nominees
  # POST /nominees.json
  def create
    @nominee = Nominee.new(params[:nominee])

    Rails.logger.debug(params.inspect)

    respond_to do |format|
      if @nominee.save
        format.html { redirect_to @nominee, notice: 'Nominee was successfully created.' }
        format.json { render json: @nominee, status: :created, location: @nominee }
      else
        format.html { render action: "new" }
        format.json { render json: @nominee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nominees/1
  # PUT /nominees/1.json
  def update
    @nominee = Nominee.find(params[:id])

    respond_to do |format|
      if @nominee.update_attributes(params[:nominee])
        format.html { redirect_to @nominee, notice: 'Nominee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nominee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nominees/1
  # DELETE /nominees/1.json
  def destroy
    @nominee = Nominee.find(params[:id])
    @nominee.destroy

    respond_to do |format|
      format.html { redirect_to nominees_url }
      format.json { head :no_content }
    end
  end
end
