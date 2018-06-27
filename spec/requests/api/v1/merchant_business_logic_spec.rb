require 'rails_helper'

describe 'Merchant business logic API' do
  it 'loads customers with pending invoices' do
    id = create(:merchant).id
    cust1 = create(:customer)
    cust2 = create(:customer)
    cust3 = create(:customer)
    invoice1 = create(:invoice, merchant_id: id, customer_id: cust1.id)
    invoice2 = create(:pending_invoice, merchant_id: id, customer_id: cust2.id)
    invoice3 = create(:pending_invoice, merchant_id: id, customer_id: cust3.id)

    get "/api/v1/merchants/#{id}/customers_with_pending_invoices"

    expect(response).to be_successful
    customers = JSON.parse(response.body)
    expect(customers.count).to eq(2)
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
end
