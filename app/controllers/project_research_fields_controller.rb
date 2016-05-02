class ProjectResearchFieldsController < ApplicationController
  before_action :set_project_research_field, only: [:show, :edit, :update, :destroy]

  # GET /project_research_fields
  # GET /project_research_fields.json
  def index
    @project_research_fields = ProjectResearchField.where("project_id = ?", params[:project_id])
    @research_fields_available_ids = @project_research_fields.pluck(:research_field_id)

    if @research_fields_available_ids.length > 0
      @research_fields = ResearchField.where('id NOT IN (?)', @research_fields_available_ids)
    else
      @research_fields = ResearchField.all
    end
    if params[:project_id]
      @project = Project.find(params[:project_id])
    end
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

  def add
    @project_research_field = ProjectResearchField.new
    @project_research_field.project_id = params[:project_id]
    @project = Project.find(params[:project_id])
    @project_research_field.research_field_id = params[:research_field]

    respond_to do |format|
      if @project_research_field.save
        format.html { redirect_to project_research_fields_index_path(@project), notice: 'Research field was successfully added to your project.' }
        format.json { render :show, status: :created, location: @project_research_fields }
      else
        format.html { render :index }
        format.json { render json: @project_research_fields.errors, status: :unprocessable_entity }
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
    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.html { redirect_to project_research_fields_index_path(@project), notice: 'Project research field was successfully destroyed.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_research_field_params2
      params.fetch(:project_research_field, :project)
    end
end
