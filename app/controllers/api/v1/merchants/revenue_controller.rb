class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    date = Date.parse("#{params[:date]} 00:00:00 UTC")
    revenue = Invoice.revenue_by_date(date)
    render json: {"total_revenue" => ((revenue.to_f + 0.0001)/100).round(2).to_s}
  end

  def show
    if params[:date]
      date = Date.parse("#{params[:date]} 00:00:00 UTC")
      id = Merchant.find(params[:id]).id
      revenue = Invoice.where(merchant_id: id)
                       .joins("INNER JOIN invoice_items ON invoice_items.invoice_id=invoices.id INNER JOIN transactions ON transactions.invoice_id=invoices.id")
                       .where("transactions.result='success'")
                       .where("invoices.updated_at BETWEEN '#{date}' AND '#{date + 1}'")
                       .sum('invoice_items.unit_price * invoice_items.quantity')
      render json: {"revenue"=>"#{((revenue.to_f + 0.0001)/100).round(2).to_s}"}
    else
     id = Merchant.find(params[:id]).id
     revenue = Invoice.where(merchant_id: id)
                      .joins("INNER JOIN invoice_items ON invoice_items.invoice_id=invoices.id INNER JOIN transactions ON transactions.invoice_id=invoices.id")
                      .where("transactions.result='success'")
                      .sum('invoice_items.unit_price * invoice_items.quantity')

     render json: {"revenue"=>"#{((revenue.to_f + 0.0001)/100).round(2).to_s}"}
   end
 end
end
