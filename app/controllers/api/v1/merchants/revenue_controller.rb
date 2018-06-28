class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    id = Merchant.find(params[:id]).id
    revenue = Invoice.where(merchant_id: id)
                     .joins("INNER JOIN invoice_items ON invoice_items.invoice_id=invoices.id INNER JOIN transactions ON transactions.invoice_id=invoices.id")
                     .where("transactions.result='success'")
                     .sum('invoice_items.unit_price * invoice_items.quantity')

    render json: {"revenue"=>"#{((revenue.to_f + 0.0001)/100).round(2).to_s}"}
  end

  def index
    date = Date.parse("#{params[:date]} 00:00:00 UTC")
    revenue = Invoice.where("invoices.updated_at BETWEEN '#{date}' AND '#{date + 1}'").joins(:invoice_items).joins(:transactions).where("transactions.result='success'").sum("invoice_items.unit_price * invoice_items.quantity")
    render json: {"total_revenue" => ((revenue.to_f + 0.0001)/100).round(2).to_s}

  end
end
