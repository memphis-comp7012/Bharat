class ProfilesController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    if !current_user.profile.blank?
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    end
    @profile = Profile.new

  end

  # GET /profiles/1/edit
  def edit
    if current_user.profile != @profile
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @user = current_user
    @profile = Profile.new(profile_params)
    @profile.user = @user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      ## redirect_to login_path, :notice => 'if you want to add a notice'
      ## if you want render 404 page
      render :file => File.join(Rails.root, 'public/403'), :formats => [:html], :status => 403, :layout => false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :bio, :education_level, :phone_number, :summary_of_projects, :skills, :department_id)
    end
end
