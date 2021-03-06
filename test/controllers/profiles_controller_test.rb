require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
  	@user = users(:chandra)
  	@user2 = users(:lasya)
    @profile = profiles(:chandra)
    @profile2 = profiles(:lasya)
  end

  test "should get index" do
  	sign_in :user, @user
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "index should be 404'd for user not signed in" do
    get :index
    assert_response(403)
  end

  test "new user without profile should get new" do
  	sign_in :user, @user2
    get :new
    assert_response :success
  end

  test "user with profile should not get new" do
  	sign_in :user, @user
    get :new
    assert_response(403)
  end

  test "new should be 404'd for user not signed in" do
    get :new
    assert_response(403)
  end

  test "signed in user should create profile" do
  	sign_in :user, @user2
    assert_difference('Profile.count') do
      post :create, profile: { bio: @profile2.bio, education_level: @profile2.education_level, first_name: @profile2.first_name, last_name: @profile2.last_name, phone_number: @profile2.phone_number, skills: @profile2.skills, summary_of_projects: @profile2.summary_of_projects }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "user not signed in should not create profile" do
    assert_no_difference('Profile.count') do
      post :create, profile: { bio: @profile2.bio, education_level: @profile2.education_level, first_name: @profile2.first_name, last_name: @profile2.last_name, phone_number: @profile2.phone_number, skills: @profile2.skills, summary_of_projects: @profile2.summary_of_projects }
    end
  end

  test "signed in user should show profile" do
  	sign_in :user, @user
    get :show, id: @profile
    assert_response :success
  end

  test "show should be 404'd for user not signed in" do
    get :show, id: @profile
    assert_response(403)
  end

  test "signed in user should get edit for his/her profile" do
  	sign_in :user, @user
    get :edit, id: @profile
    assert_response :success
  end

  test "signed in user should not get edit for another user" do
  	sign_in :user, @user
    get :edit, id: @profile2
    assert_response(403)
  end

  test "edit should be 404'd for user not signed in" do
    get :edit, id: @profile
    assert_response(403)
  end

  test "should update profile" do
  	sign_in :user, @user
    patch :update, id: @profile, profile: { bio: @profile2.bio, education_level: @profile2.education_level, first_name: @profile2.first_name, last_name: @profile2.last_name, phone_number: @profile2.phone_number, skills: @profile2.skills, summary_of_projects: @profile2.summary_of_projects }
    assert_redirected_to profile_path(assigns(:profile))
  end
  
end
