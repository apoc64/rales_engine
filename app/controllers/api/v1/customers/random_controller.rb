class Api::V1::Customers::RandomController < ApplicationController
  def show
    render json: Customer.order('RANDOM()').last
  end
end
