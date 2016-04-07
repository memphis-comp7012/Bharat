require 'test_helper'

class ProfileResearchFieldsControllerTest < ActionController::TestCase
  setup do
    @profile_research_field = profile_research_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profile_research_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile_research_field" do
    assert_difference('ProfileResearchField.count') do
      post :create, profile_research_field: {}
    end

    assert_redirected_to profile_research_field_path(assigns(:profile_research_field))
  end

  test "should show profile_research_field" do
    get :show, id: @profile_research_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile_research_field
    assert_response :success
  end

  test "should update profile_research_field" do
    patch :update, id: @profile_research_field, profile_research_field: {}
    assert_redirected_to profile_research_field_path(assigns(:profile_research_field))
  end

  test "should destroy profile_research_field" do
    assert_difference('ProfileResearchField.count', -1) do
      delete :destroy, id: @profile_research_field
    end

    assert_redirected_to profile_research_fields_path
  end
end
