# frozen_string_literal: true

# projects controller
class ProjectsController < ApplicationController
  authorize_resource

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @perks = @project.sort_perks_by_min_amount
    @comments = @project.project_comments
  end

  def create
    user = current_user

    project = user.projects.new(project_params(params))

    if project.save
      redirect_to project, flash: { success: 'Project created successfully' }
    else
      flash[:error] = project.errors.full_messages.to_sentence

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
    @user = current_user
    @project = @user.projects.find(params[:id])

    if @project.update(project_params(params))
      redirect_to @project, flash: { success: 'Project successfully updated!' }
    else
      flash[:error] = @project.errors.full_messages.to_sentence

      render 'edit'
    end
  end

  def destroy
    user = current_user
    project = Project.find(params[:id])

    if Project.destroy(project)
      redirect_to user, flash: { success: 'Project deleted successfully' }
    else
      redirect_to user, flash: { error: project.errors.full_messages.to_sentence }
    end
  end

  def delete_pic
    picture = ActiveStorage::Attachment.find(params[:id])
    project = Project.find(params[:project_id])

    picture.purge
    redirect_to project, flash: { success: 'Successfully deleted photo' }
  end

  private

  def project_params(params)
    params.require(:project).permit(
      :name,
      :description,
      :hardware,
      :target_amount,
      :target_date,
      :category,
      :country,
      :city,
      picture: []
    )
  end

end
