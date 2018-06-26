class Api::V1::Invoices::SearchController < ApplicationController
  def show
    render json: Invoice.find_by(invoice_params)
  end

  private

  def invoice_params
    params.permit(:id)
  end
end
