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

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    project = Project.find(params[:project_id])

    if @comment.update(update_comment_params(params))
      redirect_to project, flash: { success: 'Successfully updated comment!' }
    else
      redirect_to edit_project_comment_path(project, @comment),
        flash: { error: @comment.errors.full_messages.to_sentence }
    end
  end

  private
    def comment_params(params)
      params.require(:comment).permit(:content, :project_id)
    end

    def update_comment_params(params)
      params.require(:comment).permit(:content)
    end
end
