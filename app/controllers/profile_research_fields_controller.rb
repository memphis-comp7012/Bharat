class ProfileResearchFieldsController < ApplicationController
  before_action :set_profile_research_field, only: [:show, :edit, :update, :destroy]

  # GET /profile_research_fields
  # GET /profile_research_fields.json
  def index
    @profile_research_fields = ProfileResearchField.all
    @research_fields = ResearchField.all
  end

  # GET /profile_research_fields/1
  # GET /profile_research_fields/1.json
  def show
  end

  # GET /profile_research_fields/new
  def new
    @profile_research_field = ProfileResearchField.new
  end

  # GET /profile_research_fields/1/edit
  def edit
  end

  # POST /profile_research_fields
  # POST /profile_research_fields.json
  def create
    @profile_research_field = ProfileResearchField.new(profile_research_field_params)

    respond_to do |format|
      if @profile_research_field.save
        format.html { redirect_to @profile_research_field, notice: 'Profile research field was successfully created.' }
        format.json { render :show, status: :created, location: @profile_research_field }
      else
        format.html { render :new }
        format.json { render json: @profile_research_field.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @profile_research_field = ProfileResearchField.new()
    @profile_research_field.profile = current_user.profile
    res_field = params[:research_field]
    @profile_research_field.research_field = res_field

    respond_to do |format|
      if @profile_research_field.save
        format.html { redirect_to @profile_research_fields, notice: 'Profile research field was successfully created.' }
        format.json { render :show, status: :created, location: @profile_research_fields }
      else
        format.html { render :new }
        format.json { render json: @profile_research_fields.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_research_fields/1
  # PATCH/PUT /profile_research_fields/1.json
  def update
    respond_to do |format|
      if @profile_research_field.update(profile_research_field_params)
        format.html { redirect_to @profile_research_field, notice: 'Profile research field was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_research_field }
      else
        format.html { render :edit }
        format.json { render json: @profile_research_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_research_fields/1
  # DELETE /profile_research_fields/1.json
  def destroy
    @profile_research_field.destroy
    respond_to do |format|
      format.html { redirect_to profile_research_fields_url, notice: 'Profile research field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile_research_field
    @profile_research_field = ProfileResearchField.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_research_field_params
    params.fetch(:profile_research_field, {})
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_research_field_params_with_assoc
    params.fetch(:profile_research_field, {}).permit(:research_field)
  end
end
