class Api::V1::Merchants::CustomersController < ApplicationController
  def index
    # Will Revisit - Needs to pass spec
    customers = Customer.find_by_sql("SELECT customers.* FROM customers INNER JOIN invoices ON invoices.customer_id=customers.id INNER JOIN transactions ON transactions.invoice_id=invoices.id WHERE invoices.merchant_id=#{params[:merchant_id]} AND (SELECT COUNT(result) FROM transactions WHERE result='success')=0 GROUP BY customers.id")
    # EXCEPT SELECT customers.*, transactions.result, invoices.merchant_id FROM customers INNER JOIN invoices ON invoices.customer_id=customers.id INNER JOIN transactions ON transactions.invoice_id=invoices.id WHERE invoices.merchant_id=#{params[:merchant_id]} AND transactions.result='success'")
    # binding.pry
    render json: customers
  end

  def show
    merchant_id = params[:merchant_id]
    customer = Customer.favorite_customer_for_merchant(merchant_id)
    render json: customer
  end
end
