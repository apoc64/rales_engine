require 'rails_helper'

describe 'Merchant business logic API' do
  xit 'loads customers with pending invoices' do
    # all failed or no transactions
  end

  it 'loads the merchants favorite customer' do
    id = create(:merchant).id
    cust1 = create(:customer)
    cust2 = create(:customer)
    invoice1 = create(:invoice, merchant_id: id, customer_id: cust1.id)
    invoice2 = create(:pending_invoice, merchant_id: id, customer_id: cust2.id)
    invoice3 = create(:pending_invoice, merchant_id: id, customer_id: cust2.id)

    get "/api/v1/merchants/#{id}/favorite_customer"

    expect(response).to be_successful
    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(cust2.id)
  end

  xit 'returns the total revenue of successful transactions for a specific merchant' do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    invoice_id = create(:invoice, merchant_id: merchant.id).id
    invoice_id_2 = create(:invoice, merchant_id: merchant.id).id
    invoice_id_3 = create(:invoice, merchant_id: merchant.id).id
    create_list(:invoice_item, 3, invoice_id: invoice_id)
    transaction = create(:transaction, invoice_id: invoice_id)
    transaction2 = create(:transaction, invoice_id: invoice_id_2)
    transaction3 = create(:failed_transaction, invoice_id: invoice_id_3)

    get "/api/v1/merchants/#{merchant.id}/revenue"
    expect(response).to be_successful

    customer = JSON.parse(response.body)

    expect(merchant["id"]).to eq(merchant.id)
    expected = merchant.revenue.to_f
    expect(merchant.revenue).to eq(expected)
  end
end
