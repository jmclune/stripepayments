class ChargesController < ApplicationController
  def create
  # Amount in cents
  product = Product.find_by_sku("GROHACK2")
  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :card  => params[:stripeToken],
    :plan  => "GROHACK2"
  )

  # charge = Stripe::Charge.create(
  #   :customer    => customer.id,
  #   :amount      => product.price_in_cents,
  #   :description => product.full_description,
  #   :currency    => 'usd'
  # )

 purchase = Purchase.create(
            email: params[:stripeEmail],
            card: params[:stripeToken],
            amount: @amount,
            description: product.full_description,
            currency: 'usd',
            customer_id: customer.id,
            product_id: product.id,
            uuid: SecureRandom.uuid)

redirect_to purchase


  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end