class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy, :action]

  # GET /requests
  # GET /requests.json
  def index
    if params[:type]
      @my_requests = Request.where("user_id = ? and type = ?", current_user.id, Request.request_types[params[:type]])
      @founding_member_projects = Project.where('user_id = ?', current_user.id).pluck('id')
      @founding_member_requests = Request.where("project_id in (?) and user_id != ? and type = ?", @founding_member_projects, current_user.id, Request.request_types[params[:type]])
      @requests = @my_requests + @founding_member_requests
    else
      @my_requests = Request.where("user_id = ?", current_user.id)
      @founding_member_projects = Project.where('user_id = ?', current_user.id).pluck('id')
      @founding_member_requests = Request.where("project_id in (?) and user_id != ?", @founding_member_projects, current_user.id)
      @requests = @my_requests + @founding_member_requests
    end
    @requests = @requests.sort_by(&:created_at).uniq.reverse!
    @requests = @requests.paginate(:page => params[:page], :per_page => 5)

    @total_requests_count = @requests.length
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /requests/project/:id/join
  def join
    @request = Request.new
    @request.user_id = current_user.id
    @request.project_id = params[:project_id]
    @request.type = Request.request_types[:join]
    @request.status = Request.request_statuses[:unapproved]
    @project = Project.find(params[:project_id])
    # current user's join requests for this project
    @current_user_requests = Request.where('user_id = ? and project_id = ? and type = ?', current_user.id, @project.id, 0)

    if current_user.id == @project.user.id || @current_user_requests.length > 0 #Don't allow founding member or other users make more join for the same project than one at any cost
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    else
      respond_to do |format|
        if @request.save
          format.html { redirect_to @project, notice: 'Request was made to the founding member. You will be able to access the project when your request is approved.' }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { redirect_to @project }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # GET /requests/:id/:type
  def action
    @request = Request.find(params[:id])
    respond_to do |format|
      action = params[:type]

      if action == "approve"
        @request.status = Request.request_statuses[:approved]
        sentence = 'd'
      else
        @request.status = Request.request_statuses[:rejected]
        sentence = 'ed'
      end

      if @request.save
        format.html { redirect_to requests_path, notice: 'Request was ' + action + sentence + ' successfully.' }
        format.json { render :index, status: :ok, location: @request }
      else
        format.html { render :index }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to requests_path, notice: 'Request was successfully updated.' }
        format.json { render :index, status: :ok, location: @request }
      else
        format.html { render :index }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:type, :status, :project_id, :user_id)
  end
end
