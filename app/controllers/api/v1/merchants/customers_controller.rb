class Api::V1::Merchants::CustomersController < ApplicationController
  def index
    customers = Customer.customers_with_pending_invoices_for_merchant(params[:merchant_id])
    render json: customers
  end

  def show
    merchant_id = params[:merchant_id]
    customer = Customer.favorite_customer_for_merchant(merchant_id)
    render json: customer
  end
end
