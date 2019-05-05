class ChargesController < ApplicationController
  def new
  end

  def create
    @amount = params[:amount]
    @perk = Perk.find(params[:perk_id])

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken]
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: @perk.name,
      currency: 'aud'
    })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def show
    @amount = params[:amount]
    @perk = Perk.find(params[:perk_id])
    @project = Project.find(@perk.project_id)
  end

  def perk_charge
    @perk = Perk.find(params[:perk_id])
    @project = Project.find(@perk.project_id)
    @amount = params[:charge][:amount]
    @user = User.find(params[:charge][:user_id])

    render 'charges/perk_charge'
  end

  private
end
