class ProjectEnablrsController < ApplicationController
  authorize_resource

  def create

    user = User.find(params[:user_id])
    enablr = user.project_enablrs.new(enablr_params)
    project = Project.find(params[:project_id])
    perk = Perk.find(enablr.perk_id)

    if !ProjectEnablr.already_enabled?(project.id, user.id)
      if enablr.save
        project.increment :current_amount, params[:pledged_amount].to_i
        project.increment :backer_amount, 1
        project.save

        perk.decrement :amount_left, 1
        perk.save

        redirect_to project, flash: { success: 'Project successfully enabled!' }
      else
        redirect_to project, flash: { error: enablr.errors.full_messages.to_sentence }
      end
    else
      puts 'already_enabled'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @user = current_user
    @enablr = @user.project_enablrs.find_by_project_id(@project.id)
    @perk = Perk.find(@enablr.perk_id)

    if @enablr.can_refund?
      if @user.project_enablrs.destroy(@enablr.id)
        @project.decrease_amounts(@enablr.pledged_amount)

        EnablrMailer.with(user: @user, enablr: @enablr).refund_enablr_email.deliver_now

        redirect_to user_profile_path(@user.id), flash: { success: 'Successfully refunded project pledge' }

      else
        flash[:error] = @enablr.errors.full_messages.to_sentence

        render 'refund'
      end
    else
      flash[:alert] = render_to_string(partial: 'layouts/shared/refund_error')

      render 'refund'
    end

  end

  def refund
    @project = Project.find(params[:project_id])
    @user = current_user
    @enablr = @user.project_enablrs.find_by_project_id(@project.id)
    @perk = Perk.find(@enablr.perk_id)
  end

  private
  def enablr_params
    params.permit(:project_id, :user_id, :pledged_amount, :project_enablr, :id, :perk_id)
  end
end
