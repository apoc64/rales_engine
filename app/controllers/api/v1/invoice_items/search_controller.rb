class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    if !invoice_params.empty?
      render json: InvoiceItem.find_by(invoice_params)
    end
  end

  # def index
  #   if !invoice_params.empty?
  #     render json: Invoice.where(invoice_params)
  #   end
  # end
  #
  # private
  #
  def invoice_params
    params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end
