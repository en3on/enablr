# perks controller
class PerksController < ApplicationController
  authorize_resource

  def show
    @project = Project.find(params[:project_id])

    if user_signed_in?

      if !Perk.is_own_project?(current_user.id, @project.id)
        @perk = Perk.find(params[:id])
      else
        redirect_to @project, flash: { error: 'You can not enable your own project!' }
      end

    else
      @perks = @project.sort_perks_by_min_amount
      @comments = @project.project_comments

      flash[:alert] = render_to_string(partial: 'layouts/shared/log_in_needed')

      render 'projects/show'
    end
  end

  def new
    @perk = Perk.new
    @project = Project.find(params[:project_id])
  end

  def create
    @project = Project.find(params[:project_id])

    @perk = @project.perks.new(perk_params(params))

    if @perk.save
      redirect_to @project, flash: { success: 'Perk created successfully!' }
    else
      flash[:error] = @perk.errors.full_messages.to_sentence

      render 'new'
    end
  end

  def edit
    @perk = Perk.find(params[:id])
  end

  def update
    @perk = Perk.find(params[:id])

    if @perk.update(perk_params(params))
      redirect_to project_path(@perk.project_id), flash: { success: 'Perk updated successfully!' }
    else
      flash[:error] = @perk.errors.full_messages.to_sentence

      render 'edit'
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    perk = Perk.find(params[:id])

    if project.perks.destroy(perk)
      redirect_to project, flash: { success: 'Perk deleted successfully!' }
    else
      redirect_to project, flash: { error: perk.errors.full_messages.to_sentence }
    end
  end

  private

  def perk_params(params)
    params.require(:perk).permit(
      :name,
      :rewards,
      :minimum_amount,
      :amount_left,
      :estimated_delivery,
      :not_deliverable
    )
  end
end
