class Api::V1::Items::RevenueController < ApplicationController
  def index
    # Most revenue
    items = Item.select("items.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins(:invoice_items).group(:id).order("revenue DESC").limit(params[:quantity])
    render json: items
  end
end
