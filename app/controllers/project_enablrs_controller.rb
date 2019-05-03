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
    user = User.find(current_user.id)
    project = Project.find(params[:project_id])
    enablr = user.project_enablrs.find_by(project_id: project.id)

    if user.project_enablrs.destroy(enablr.id)
      project.decrement :current_amount, enablr.pledged_amount
      project.save
      redirect_to user_profile_path(user.id)
    else
      # errors!
      render user
    end

  end

  def update
    
  end

  private
  def enablr_params
    params.permit(:project_id, :user_id, :pledged_amount)
  end
end
