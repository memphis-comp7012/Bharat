class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    if params[:status]
      @tasks = Task.where("user_id = ? and status = ?", current_user.id, Task.statuses[params[:status]])
    else
      @tasks = Task.where("user_id = ?", current_user.id)
    end
    @total_tasks_count = @tasks.length

    @tasks = @tasks.sort_by(&:created_at).reverse!
    @tasks = @tasks.paginate(:page => params[:page], :per_page => 3)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    project_id = Iteration.find(@task.iteration_id).project_id
    team = Team.where('project_id = ? and user_id = ?', project_id, current_user.id)
    founding_member_id = Project.find(project_id).user_id

    if ((current_user.id != founding_member_id) && (team.length <= 0))
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    end
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @users = User.all

    # you cannot create a new tasks for project you don't belong to
    if params[:iteration_id]
      project_id = Iteration.find(params[:iteration_id]).project_id
      team = Team.where('project_id = ? and user_id = ?', project_id, current_user.id)

      founding_member_id = Project.find(project_id).user_id
      if (current_user.id != founding_member_id) && team.length <= 0
        render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
      end
    end

  end

  # GET /tasks/1/edit
  def edit
    project_id = Iteration.find(@task.iteration_id).project_id
    team = Team.where('project_id = ? and user_id = ?', project_id, current_user.id)

    # You cannot delete the tasks you don't belong to and not created by you
    founding_member_id = Project.find(project_id).user_id

    if (current_user.id != founding_member_id) && (@task.user_id != current_user.id) && team.length <= 0
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    # you cannot create a new tasks for project you don't belong to
    project_id = Iteration.find(@task.iteration_id).project_id
    team = Team.where('project_id = ? and user_id = ?', project_id, current_user.id)
    founding_member_id = Project.find(project_id).user_id

    if ((current_user.id != founding_member_id) && (team.length <= 0))
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    end
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :action => :show, status: :created, location: @task }
      else
        format.html { render :action => :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    # you cannot update a  tasks for project you don't belong to
    project_id = Iteration.find(@task.iteration_id).project_id
    team = Team.where('project_id = ? and user_id = ?', project_id, current_user.id)
    founding_member_id = Project.find(project_id).user_id

    if ((current_user.id != founding_member_id) && (team.length <= 0))
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    end
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    # user cannot delete tasks other than he created
    iteration = Iteration.find(@task.iteration_id)
    founding_member_id = iteration.project.user_id

    if (iteration.project.user_id != current_user.id) && (@task.user_id != current_user.id)
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    else
      @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :description, :status, :assigned_user, :due_date, :user_id, :iteration_id)
  end
end
