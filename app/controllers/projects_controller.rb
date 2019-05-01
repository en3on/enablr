# frozen_string_literal: true

# projects controller
class ProjectsController < ApplicationController
  authorize_resource

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    user = User.find(params[:user_id])

    project = user.projects.new(project_params(params[:project]))

    if project.save
      # redirect_to project
      puts 'saved'
    else
      render 'new'
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    user = User.find(params[:user_id])
    project = user.projects.find(params[:id])

    project.update(project_params(params[:project]))

    redirect_to project
  end

  def destroy
    user = User.find(params[:user_id])

    user.projects.destroy(params[:id])
  end

  private
  def project_params(params)
    params.permit(:name, :description, :hardware, :target_amount, :target_date, :category, :country, :city)
  end

end
