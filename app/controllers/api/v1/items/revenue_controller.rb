class Api::V1::Items::RevenueController < ApplicationController
  def index
    items = Item.highest_revenue_items(params[:quantity])
    render json: items
  end
end
