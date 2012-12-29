class GraduateProfessionsController < ApplicationController
  # GET /graduate_professions
  # GET /graduate_professions.json
  def index
    @graduate_professions = GraduateProfession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @graduate_professions }
    end
  end

  # GET /graduate_professions/1
  # GET /graduate_professions/1.json
  def show
    @graduate_profession = GraduateProfession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @graduate_profession }
    end
  end

  # GET /graduate_professions/new
  # GET /graduate_professions/new.json
  def new
    @graduate_profession = GraduateProfession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @graduate_profession }
    end
  end

  # GET /graduate_professions/1/edit
  def edit
    @graduate_profession = GraduateProfession.find(params[:id])
  end

  # POST /graduate_professions
  # POST /graduate_professions.json
  def create
    @graduate_profession = GraduateProfession.new(params[:graduate_profession])

    respond_to do |format|
      if @graduate_profession.save
        format.html { redirect_to @graduate_profession, notice: 'Graduate profession was successfully created.' }
        format.json { render json: @graduate_profession, status: :created, location: @graduate_profession }
      else
        format.html { render action: "new" }
        format.json { render json: @graduate_profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /graduate_professions/1
  # PUT /graduate_professions/1.json
  def update
    @graduate_profession = GraduateProfession.find(params[:id])

    respond_to do |format|
      if @graduate_profession.update_attributes(params[:graduate_profession])
        format.html { redirect_to @graduate_profession, notice: 'Graduate profession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @graduate_profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduate_professions/1
  # DELETE /graduate_professions/1.json
  def destroy
    @graduate_profession = GraduateProfession.find(params[:id])
    @graduate_profession.destroy

    respond_to do |format|
      format.html { redirect_to graduate_professions_url }
      format.json { head :no_content }
    end
  end
end
