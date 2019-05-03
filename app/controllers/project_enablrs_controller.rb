class ProjectEnablrsController < ApplicationController
  authorize_resource

  def create

    user = User.find(params[:user_id])
    enablr = user.project_enablrs.new(enablr_params)
    project = Project.find(params[:project_id])

    if !ProjectEnablr.already_enabled?(project.id, user.id)
      if enablr.save
        project.increment :current_amount, params[:pledged_amount].to_i
        project.save
        redirect_to project
      else
        enablr.errors.each { |e, v| puts "#{e}: #{v}" }
      end
    else
      puts 'already_enabled'
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

  def edit
    @enablr = ProjectEnablr.find(params[:id])
  end

  def update
    @enablr = ProjectEnablr.find(params[:id])

    project = Project.find(@enablr.project_id)
    amount = params[:project_enablr][:pledged_amount].to_f

    pledge_change = amount - @enablr.pledged_amount

    if @enablr.update(pledged_amount: amount)
      if pledge_change.negative?
        project.decrement :current_amount, pledge_change.abs
      else
        project.increment :current_amount, pledge_change
      end

      project.save
      redirect_to user_profile_path(current_user.id)
    end
  end

  private
  def enablr_params
    params.permit(:project_id, :user_id, :pledged_amount, :project_enablr, :id)
  end
end
