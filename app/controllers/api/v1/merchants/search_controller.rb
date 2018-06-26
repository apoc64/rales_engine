class Api::V1::Merchants::SearchController < ApplicationController
  def show
    if !merchant_params.empty?
      render json: Merchant.find_by(merchant_params)
    end
  end

  def index
    if !merchant_params.empty?
      render json: Merchant.where(merchant_params)
    end
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
