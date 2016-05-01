class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
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

    if current_user.id == @project.user.id || current_user.requests.count > 0 #Don't allow founding member or other users make more than one at any cost
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

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
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
