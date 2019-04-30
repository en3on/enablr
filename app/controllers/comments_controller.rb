# frozen_string_literal: true

# comments controller
class CommentsController < ApplicationController

  private

  def comment_params
    params.permit([:content])
  end
end
