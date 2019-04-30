# frozen_string_literal: true

# projects controller
class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
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
    @project = Project.find(params[:id])
    @user = User.find(@project.user_id)

    @user.projects.update(project_params)
  end

  def destroy
    @project = Project.find(params[:id])

    @user = User.find(@project.user_id)

    @user.projects.destroy(@project)

    redirect_to root_path
  end

  private
  def project_params
    params.permit(:name, :description, :hardware, :target_amount, :target_date, :category, :country, :city)
  end

end
