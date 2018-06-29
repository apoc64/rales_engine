class Api::V1::Customers::SearchController < ApplicationController
  def show
    if !customer_params.empty?
      render json: Customer.find_by(customer_params)
    end
  end

  def index
    if !customer_params.empty?
      render json: Customer.where(customer_params)
    end
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end
end
