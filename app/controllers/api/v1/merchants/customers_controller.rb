class Api::V1::Merchants::CustomersController < ApplicationController
  def index
    # Will Revisit - Needs to pass spec
    customers = Customer.joins(:invoices).where("invoices.merchant_id=#{params[:merchant_id]} AND invoices.status='pending'")
    render json: customers
  end

  def show
    customer = Customer.select('customers.id, COUNT(invoices.id) AS icount').joins(:invoices).where("invoices.merchant_id=#{params[:merchant_id]}").group('customers.id').order('icount DESC').first
    render json: customer
  end
end
