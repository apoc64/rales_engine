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

  xit 'returns total revenue for date for all merchants' do
    invoice = create(:invoice, created_at: '2012-03-25 09:54:09 UTC')
    create_list(:invoice_item, 3, invoice_id: invoice.id)
    create_list(:invoice_item, 2)
    create(:transaction, invoice_id: invoice.id, result: 'success')

    get '/api/v1/merchants/revenue?date=2012-03-25'

    revenue = JSON.parse(response.body)
    expect(revenue["total_revenue"]).to eq("450.00")
  end

  it 'returns merchants with most reveune' do
    merch1 = create(:merchant)
    merch2 = create(:merchant)
    invoice = create(:invoice, merchant_id: merch1.id)
    create_list(:invoice_item, 3, invoice_id: invoice.id)
    create_list(:invoice_item, 2)
    create(:transaction, invoice_id: invoice.id, result: 'success')

    get "/api/v1/merchants/most_revenue?quantity=1"

    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq(1)
  end
end
