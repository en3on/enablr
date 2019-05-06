class CommentsController < ApplicationController
  authorize_resource

  def create
    enablr = ProjectEnablr.find_by(user_id: current_user.id)

    project = Project.find(comment_params(params)[:project_id])

    comment = enablr.comments.new(comment_params(params))

    if comment.save
      redirect_to project
    else
      # errors!
    end
  end

  def destroy
    project = Project.find(params[:project_id])

    project.comments.destroy(params[:id])

    redirect_to project
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
    def comment_params(params)
      params.require(:comment).permit(:content, :project_id)
    end
end
