class IterationsController < ApplicationController
  before_action :set_iteration, only: [:show, :edit, :update, :destroy]

  # GET /iterations
  # GET /iterations.json
  def index
    @iterations = Iteration.all
  end

  # GET /iterations/1
  # GET /iterations/1.json
  def show
    @project = Project.find_by_id(params[:project_id])
    @tasks = Task.where('iteration_id = ?', @iteration.id)
  end

  # GET /iterations/new
  def new
    @iteration = Iteration.new
    @project = Project.find_by_id(params[:project_id])
  end

  # GET /iterations/1/edit
  def edit 
    @project = Project.find_by_id(params[:project_id])
  end

  # POST /iterations
  # POST /iterations.json
  def create
    @iteration = Iteration.new(iteration_params)

    @project = Project.find_by_id(params[:project_id])

    respond_to do |format|
      if @iteration.save
        format.html { redirect_to project_path(@project), notice: 'Iteration was successfully created.' }
        format.json { render :show, status: :created, location: @iteration }
      else
        format.html { render :new }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iterations/1
  # PATCH/PUT /iterations/1.json
  def update
    @project = Project.find_by_id(params[:project_id])
    respond_to do |format|
      if @iteration.update(iteration_params)
        format.html { redirect_to project_path(@iteration.project.id), notice: 'Iteration was successfully updated.' }
        format.json { render :show, status: :ok, location: @iteration }
      else
        format.html { render :edit }
        format.json { render json: @iteration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iterations/1
  # DELETE /iterations/1.json
  def destroy
    
    @project = Project.find_by_id(params[:project_id])

    @iteration.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project), notice: 'Iteration was successfully destroyed.' }
      # format.html { redirect_to project_path(params[:project_id]), notice: 'Iteration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iteration
      @iteration = Iteration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iteration_params
      params.require(:iteration).permit(:name, :project_id)
    end
end
