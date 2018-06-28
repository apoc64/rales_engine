class Api::V1::Merchants::MostRevenueController < ApplicationController
  def index
    merchants = Merchant.merchants_with_most_revenue(params[:quantity])
    render json: merchants
  end
end
