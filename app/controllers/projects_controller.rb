# frozen_string_literal: true

# projects controller
class ProjectsController < ApplicationController
  authorize_resource

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])

    @enablrs = ProjectEnablr.where(project_id: @project.id)

    @comments = []

    @enablrs.each do |enablr|
      comments = Comment.where(project_enablr_id: enablr.id)

      comments.each { |c| @comments << c }
    end
  end

  def create
    user = current_user

    project = user.projects.new(project_params(params))

    if project.save
      redirect_to project
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
    user = current_user
    project = user.projects.find(params[:id])

    project.update(project_params(params))

    redirect_to project
  end

  def destroy
    user = current_user

    user.projects.destroy(params[:id])

    redirect_to projects_path
  end

  private
  def project_params(params)
    params.require(:project).permit(:name, :description, :hardware, :target_amount, :target_date, :category, :country, :city)
  end

end
