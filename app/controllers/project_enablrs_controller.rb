class ProjectEnablrsController < ApplicationController
  authorize_resource

  def destroy
    project_enablr = ProjectEnablr.find(params[:id])

    user = current_user

    user.ProjectEnablr.destroy(project_enablr)
  end
end
