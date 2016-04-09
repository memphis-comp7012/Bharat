class ProjectResearchFieldsController < ApplicationController
  before_action :set_project_research_field, only: [:show, :edit, :update, :destroy]

  # GET /project_research_fields
  # GET /project_research_fields.json
  def index
    @project_research_fields = ProjectResearchField.all
  end

  # GET /project_research_fields/1
  # GET /project_research_fields/1.json
  def show
  end

  # GET /project_research_fields/new
  def new
    @project_research_field = ProjectResearchField.new
  end

  # GET /project_research_fields/1/edit
  def edit
  end

  # POST /project_research_fields
  # POST /project_research_fields.json
  def create
    @project_research_field = ProjectResearchField.new(project_research_field_params)

    respond_to do |format|
      if @project_research_field.save
        format.html { redirect_to @project_research_field, notice: 'Project research field was successfully created.' }
        format.json { render :show, status: :created, location: @project_research_field }
      else
        format.html { render :new }
        format.json { render json: @project_research_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_research_fields/1
  # PATCH/PUT /project_research_fields/1.json
  def update
    respond_to do |format|
      if @project_research_field.update(project_research_field_params)
        format.html { redirect_to @project_research_field, notice: 'Project research field was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_research_field }
      else
        format.html { render :edit }
        format.json { render json: @project_research_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_research_fields/1
  # DELETE /project_research_fields/1.json
  def destroy
    @project_research_field.destroy
    respond_to do |format|
      format.html { redirect_to project_research_fields_url, notice: 'Project research field was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_research_field
      @project_research_field = ProjectResearchField.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_research_field_params
      params.fetch(:project_research_field, {})
    end
end
