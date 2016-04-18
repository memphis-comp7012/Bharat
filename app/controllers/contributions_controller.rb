class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :edit, :update, :destroy]

  # GET /contributions
  # GET /contributions.json
  def index
    @contributions = Contribution.all
    @contributions = Contribution.where("user_id == ?", current_user.id)

    if params[:show]
      if params[:show] == 'earned'
        @contributions = Contribution.where("score > ? AND money_received > ? AND user_id == ?", 0, 0, current_user.id)
      end
      if params[:show] == 'lost'
        @contributions = Contribution.where("score < ? AND user_id == ?", 0, current_user.id)
      end
    end
  end

  def complete
    @contributions = Contribution.where('project_id == ?', params[:project_id])
    @project = Project.find(params[:project_id])
    @teams = Team.where('project_id == ?', params[:project_id])
  end

  def add
    @contribution = Contribution.new
    @project = Project.find(params[:project_id])
    @team_member = User.find(params[:user_id])
  end

  def save
    @contribution = Contribution.new(contribution_params)
    @contribution.user_id = params[:user_id]
    @contribution.project_id = params[:project_id]
    @project = Project.find(params[:project_id])

    respond_to do |format|
      if @contribution.save
        format.html { redirect_to project_contributions_path(@project), notice: 'Contribution was successfully created.' }
        format.json { render :show, status: :created, location: @contribution }
      else
        format.html { render :new }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /contributions/1x`1`
  # GET /contributions/1.json
  def show
  end

  # GET /contributions/new
  def new
    @contribution = Contribution.new
  end

  # GET /contributions/1/edit
  def edit
  end

  # POST /contributions
  # POST /contributions.json
  def create
    @contribution = Contribution.new(contribution_params)

    respond_to do |format|
      if @contribution.save
        format.html { redirect_to @contribution, notice: 'Contribution was successfully created.' }
        format.json { render :show, status: :created, location: @contribution }
      else
        format.html { render :new }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contributions/1
  # PATCH/PUT /contributions/1.json
  def update
    respond_to do |format|
      if @contribution.update(contribution_params)
        format.html { redirect_to @contribution, notice: 'Contribution was successfully updated.' }
        format.json { render :show, status: :ok, location: @contribution }
      else
        format.html { render :edit }
        format.json { render json: @contribution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributions/1
  # DELETE /contributions/1.json
  def destroy
    @contribution.destroy
    respond_to do |format|
      format.html { redirect_to contributions_url, notice: 'Contribution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contribution
    @contribution = Contribution.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contribution_params
    params.require(:contribution).permit(:score, :money_received )
  end
end
