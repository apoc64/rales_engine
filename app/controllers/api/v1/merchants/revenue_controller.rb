class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    date = Date.parse("#{params[:date]} 00:00:00 UTC")
    revenue = Invoice.revenue_by_date(date)
    render json: {"total_revenue" => ((revenue.to_f + 0.0001)/100).round(2).to_s}
  end
end
