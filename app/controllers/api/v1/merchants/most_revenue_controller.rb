class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    merchants = Merchant.select("merchants.*, SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue").joins("INNER JOIN invoices ON invoices.merchant_id=merchants.id INNER JOIN invoice_items ON invoice_items.invoice_id=invoices.id").group("merchants.id").order("revenue DESC").limit(params[:quantity])
    # binding.pry
    render json: merchants
  end
end
