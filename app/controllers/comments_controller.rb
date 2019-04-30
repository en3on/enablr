class CommentsController < ApplicationController
  private
  def comment_params
    params.permit([:content])
  end
end
