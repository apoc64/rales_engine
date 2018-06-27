class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    if !invoice_item_params.empty?
      render json: InvoiceItem.find_by(invoice_item_params)
    end
  end

  def index
    if !invoice_item_params.empty?
      render json: InvoiceItem.where(invoice_item_params)
    end
  end

  private

  def invoice_item_params
    permitted = params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price, :created_at, :updated_at)

    if permitted[:unit_price]
      permitted[:unit_price] = (((permitted[:unit_price].to_f) * 100) + 0.0001).round
    end
    permitted
  end
end
