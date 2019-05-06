class CommentsController < ApplicationController
  authorize_resource

  def create
    @project_enablr = ProjectEnablr.find(params[:project_enablr_id])
    @comment = @project_enablr.comments.create(comment_params)
    redirect_to project_enablr_path(@project_enablr.id)
  end

  def destroy
    @project_enablr = ProjectEnablr.find(params[:project_enablr_id])
    @comment = @project_enablr.comments.find(params[:id])
    @comment.destroy
    redirect_to project_enablrs_path
  end

  def update
    @project_enablr = ProjectEnablr.find(params[:project_enablr_id])
    @comment = @project_enablr.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  private
    def comment_params
      params.permit([:content])
    end
end
