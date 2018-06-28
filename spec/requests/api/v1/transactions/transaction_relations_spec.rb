require 'rails_helper'

describe 'Transacgtion Relationships API' do
  it 'loads invoice for that transaction' do
    original_invoice = create(:invoice)
    transaction = create(:transaction, invoice_id: original_invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(original_invoice.id)
  end
end
