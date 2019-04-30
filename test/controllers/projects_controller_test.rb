require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @project = projects(:software_1)
  end

  test 'should create new software project' do
    project = @user.projects.new({
                                   name: @project.name,
                                   description: @project.description,
                                   hardware: @project.hardware,
                                   current_amount: @project.current_amount,
                                   target_amount: @project.target_amount,
                                   target_date: @project.target_date,
                                   category: @project.category,
                                   country: @project.country,
                                   city: @project.city,
                                   backer_amount: @project.backer_amount
                                  })

    assert project.save, 'project not saved!'

    assert_not_nil @user.projects.find(project.id), 'project not created!'
  end

end
