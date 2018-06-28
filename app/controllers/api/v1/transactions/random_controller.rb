class Api::V1::Transactions::RandomController < ApplicationController
  def show
    render json: Transaction.order('RANDOM()').last
  end
end
