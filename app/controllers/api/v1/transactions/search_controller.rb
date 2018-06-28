class Api::V1::Transactions::SearchController < ApplicationController
  def show
    if !transaction_params.empty?
      render json: Transaction.find_by(transaction_params)
    end
  end

  def index
    if !transaction_params.empty?
      render json: Transaction.where(transaction_params)
    end
  end

  private

  def transaction_params
    params.permit(:id, :credit_card_number, :credit_card_expiration, :result, :invoice_id, :created_at, :updated_at)
  end
end
