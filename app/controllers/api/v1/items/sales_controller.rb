class Api::V1::Items::SalesController < ApplicationController
  def index
    items = Item.most_sold_items(params[:quantity])
    render json: items
  end
end
