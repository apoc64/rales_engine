class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    # binding.pry
    the_revenue = InvoiceItem.unscoped.select("SUM(unit_price * quantity) AS revenue").where("created_at BETWEEN '#{params[:date]}' AND '#{(Date.parse(params[:date]) + 1)}'")
    # binding.pry
    rev = the_revenue
    puts rev
    revs = rev.first
    revvy = revs.revenue
    total = revvy / 100
    render json: {"revenue" => total}
  end
end
