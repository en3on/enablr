require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    project_params = projects(:software_1)

    @project = @user.projects.new(
      name: project_params.name,
      description: project_params.description,
      hardware: project_params.hardware,
      target_amount: project_params.target_amount,
      target_date: project_params.target_date,
      category: project_params.category,
      country: project_params.country,
      city: project_params.city
    )

    @project.save
  end

  test 'should create new software project' do
    assert_not_nil @user.projects.find(@project.id), 'Projet not saved!'
  end

  test 'should initialize with 0 current_amount' do
    assert_equal 0, @project.current_amount, "Project's current_amount is not 0!"
  end

  test 'should initialize with 0 backer_amount' do
    assert_equal 0, @project.backer_amount, "Project's backer_amount is not 0!"
  end

  test 'should get index' do
    get projects_path

    assert_response :success
  end

  test 'should get new_project' do
    get new_project_path

    assert_response :success
  end

  test 'should get edit_project' do
    get edit_project_path(@project.id)

    assert_response :success
  end

  test 'should get show' do
    get project_path(@project.id)

    assert_response :success
  end

  test 'should delete project' do
    assert_difference('@user.projects.count', -1) do
      delete project_path(@project.id)
    end
  end

  test 'should change project name' do
    @project.name = 'changed'

    patch project_path(@project)

    assert_equal 'changed', @project.name, 'Project name was not changed!'
  end
end


