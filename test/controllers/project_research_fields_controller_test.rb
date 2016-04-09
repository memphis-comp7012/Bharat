require 'test_helper'

class ProjectResearchFieldsControllerTest < ActionController::TestCase
  setup do
    @project_research_field = project_research_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_research_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_research_field" do
    assert_difference('ProjectResearchField.count') do
      post :create, project_research_field: {  }
    end

    assert_redirected_to project_research_field_path(assigns(:project_research_field))
  end

  test "should show project_research_field" do
    get :show, id: @project_research_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_research_field
    assert_response :success
  end

  test "should update project_research_field" do
    patch :update, id: @project_research_field, project_research_field: {  }
    assert_redirected_to project_research_field_path(assigns(:project_research_field))
  end

  test "should destroy project_research_field" do
    assert_difference('ProjectResearchField.count', -1) do
      delete :destroy, id: @project_research_field
    end

    assert_redirected_to project_research_fields_path
  end
end
