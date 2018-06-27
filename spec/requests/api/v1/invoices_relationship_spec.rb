require 'rails_helper'

describe 'Invoice API relationship end point' do
  it 'returns transactions for a specific invoice' do
    invoice = create(:invoice)

    get "/api/v1/invoices/#{invoice.id}/transactions"
    expect(response).to be_success

    transactions = JSON.parse(response.body)
    expect(transactions).to eq(invoice.transactions)
  end

  it 'returns invoice items for a single invoice' do
    invoice = create(:invoice)
    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    expect(invoice_items).to eq(invoice.invoice_items)
  end
end
