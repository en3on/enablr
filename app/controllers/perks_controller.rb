# perks controller
class PerksController < ApplicationController
  def new
    @perk = Perk.new
    @project = Project.find(params[:project_id])
  end
end
