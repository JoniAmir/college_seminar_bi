class GraduatesController < ApplicationController
  # GET /graduates
  # GET /graduates.json
  def index
    @graduates = Graduate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @graduates }
    end
  end

  # GET /graduates/1
  # GET /graduates/1.json
  def show
    @graduate = Graduate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @graduate }
    end
  end

  # GET /graduates/new
  # GET /graduates/new.json
  def new
    @graduate = Graduate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @graduate }
    end
  end

  # GET /graduates/1/edit
  def edit
    @graduate = Graduate.find(params[:id])
  end

  # POST /graduates
  # POST /graduates.json
  def create
    @graduate = Graduate.new(params[:graduate])

    respond_to do |format|
      if @graduate.save
        format.html { redirect_to @graduate, notice: 'Graduate was successfully created.' }
        format.json { render json: @graduate, status: :created, location: @graduate }
      else
        format.html { render action: "new" }
        format.json { render json: @graduate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /graduates/1
  # PUT /graduates/1.json
  def update
    @graduate = Graduate.find(params[:id])

    respond_to do |format|
      if @graduate.update_attributes(params[:graduate])
        format.html { redirect_to @graduate, notice: 'Graduate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @graduate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduates/1
  # DELETE /graduates/1.json
  def destroy
    @graduate = Graduate.find(params[:id])
    @graduate.destroy

    respond_to do |format|
      format.html { redirect_to graduates_url }
      format.json { head :no_content }
    end
  end
end
