class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new

    @existing_team = Team.where('project_id == ?', params[:project_id]).pluck(:user_id)


    if (@existing_team.length > 0)
      @users = User.where('id NOT IN (?)', @existing_team)
    else
      @users = User.all
    end

  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    @project = Project.where("project_id == ?", @team.project.id)

    respond_to do |format|
      if @team.save
        format.html { redirect_to edit_project_path(@team.project.id), notice: 'Team was successfully added.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @project = Project.where("project_id == ?", params[:project_id])

    Team.where('user_id == ? and project_id == ?',params[:user_id], params[:project_id]).destroy_all
    respond_to do |format|
      format.html { redirect_to edit_project_path(params[:project_id]), notice: 'Team member was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:user_id, :project_id)
    end
end
