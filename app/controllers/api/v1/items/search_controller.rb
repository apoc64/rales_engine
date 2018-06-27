class Api::V1::Items::SearchController < ApplicationController
  def show
    if !items_params.empty?
      render json: Item.find_by(items_params)
    end
  end

  def index
    if !items_params.empty?
      render json: Item.where(items_params)
    end
  end

  private

  def items_params
    permitted = params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
    if permitted[:unit_price]
      permitted[:unit_price] = (((permitted[:unit_price].to_f) * 100) + 0.0001).round
    end
    permitted

  end
end
