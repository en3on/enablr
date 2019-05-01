require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  def create_project(user, project)
    @project = user.projects.new(create_project_params(project))

    @project.save
  end

  def create_project_params(project)
    {
      name: project.name,
      description: project.description,
      hardware: project.hardware,
      target_amount: project.target_amount,
      target_date: project.target_date,
      category: project.category,
      country: project.country,
      city: project.city
    }
  end

  Minitest.after_run do
    User.destroy_all
  end

  test 'should create new software project' do
    project = projects(:software)
    user = users(:fundraiser)

    project_params = create_project_params(project)

    post user_projects_path(
      user_id: user.id,
      project: project_params
    )

    new_project = user.projects.last

    assert_equal(false, new_project.hardware, 'Project was not set to software!')
  end

  test 'should initialize with 0 current_amount' do
    user = users(:fundraiser)
    project = projects(:software)

    project.current_amount = 100

    create_project(user, project)

    assert_equal(0, user.projects.last.current_amount, "Project's current amount was not zero!")
  end

  test 'should initialize with 0 backer_amount' do
    user = users(:fundraiser)
    project = projects(:software)

    project.backer_amount = 100

    create_project(user, project)

    assert_equal(0, user.projects.last.backer_amount, "Project's current amount was not zero!")
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
    create_project(users(:fundraiser), projects(:hardware))

    user_id = @project.user_id

    get edit_project_path(
      user_id: user_id,
      id: @project.id
    )

    assert_response :success
  end

  test 'should get show' do
    create_project(users(:fundraiser), projects(:software))

    user_id = @project.user_id

    get project_path(
      user_id: user_id,
      id: @project.id
    )

    assert_response :success
  end

  test 'should delete project' do
    user = users(:fundraiser)
    project_params = projects(:hardware)

    create_project(user, project_params)

    assert_difference('user.projects.count', -1) do
      delete project_path(
        user_id: user.id,
        id: @project.id
      )
    end
  end

  test 'should change project name' do
    user = users(:fundraiser)
    project_params = projects(:software)

    create_project(user, project_params)

    @project.name = 'changed'

    updated_project_params = create_project_params(@project)

    patch project_path(
      user_id: user.id,
      id: @project.id,
      project: updated_project_params
    )

    new_project = User.find(user.id).projects.find(@project.id)

    assert_equal('changed', new_project.name, 'Project name was not changed!')
  end

  test "standard user can't create project" do
    user = users(:standard)
    create_project(user, projects(:software))

    assert_equal(0, user.projects.count, 'Standard user was allowed to create project')
  end
end


