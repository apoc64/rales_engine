class Api::V1::InvoicesController < ApplicationController
  def index
    render(json: Invoice.select('id, customer_id, merchant_id, status'))
  end
end
