# perks controller
class PerksController < ApplicationController
  def new
    @perk = Perk.new
    @project = Project.find(params[:project_id])
  end

  def create
    project = Project.find(params[:project_id])

    perk = project.perks.new(perk_params(params[:perk]))
    puts "Name: #{perk.name}"

    if perk.save
      redirect_to project
    else
      perk.errors.each { |n, e| puts "#{n}: #{e}" }
    end
  end

  private
  def perk_params(params)
    params.permit(:name, :rewards, :minimum_amount, :amount_left)
  end
end
