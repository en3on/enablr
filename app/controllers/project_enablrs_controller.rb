class ProjectEnablrsController < ApplicationController
  authorize_resource

  def create

  end

  def destroy
    project_enablr = ProjectEnablr.find(params[:id])

    user = current_user

    user.ProjectEnablr.destroy(project_enablr)
  end

  private
  def enablr_params
    params.permit(:project_id, :user_id)
  end
end
