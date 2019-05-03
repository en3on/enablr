class ProjectEnablrsController < ApplicationController
  authorize_resource

  def create

    user = User.find(params[:user_id])
    enablr = user.project_enablrs.new(enablr_params)
    project = Project.find(params[:project_id])

    if enablr.save
      project.increment :current_amount, params[:pledged_amount].to_i
      project.save
      redirect_to project
    else
      enablr.errors.each { |e, v| puts "#{e}: #{v}" }
    end
  end

  def destroy
    project_enablr = ProjectEnablr.find(params[:id])

    user = current_user

    user.ProjectEnablr.destroy(project_enablr)
  end

  private
  def enablr_params
    params.permit(:project_id, :user_id, :pledged_amount)
  end
end
