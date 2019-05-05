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
      description: @perk.rewards,
      currency: 'aud'
    })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
