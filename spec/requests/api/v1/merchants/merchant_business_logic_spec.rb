require 'rails_helper'

describe 'Merchant business logic API' do
  it 'loads customers with pending invoices' do
    # all failed or no transactions
    id = create(:merchant).id
    cust1 = create(:customer)
    cust2 = create(:customer)
    iid1 = create(:invoice, merchant_id: id, customer_id: cust1.id).id
    iid2 = create(:invoice, merchant_id: id, customer_id: cust2.id).id
    iid3 = create(:invoice, merchant_id: id, customer_id: cust2.id).id
    create(:transaction, invoice_id: iid1)
    create(:transaction, invoice_id: iid2, result: 'failed')
    create(:transaction, invoice_id: iid3, result: 'failed')

    get "/api/v1/merchants/#{id}/customers_with_pending_invoices"

    expect(response).to be_successful
    customers = JSON.parse(response.body)
    expect(customers.count).to eq(1)
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

  it 'returns the total revenue of successful transactions for a specific merchant' do
    merchant = create(:merchant)
    create(:merchant)
    invoice_id = create(:invoice, merchant_id: merchant.id).id
    invoice_id_2 = create(:invoice, merchant_id: merchant.id).id
    invoice_id_3 = create(:invoice, merchant_id: merchant.id).id
    create_list(:invoice_item, 3, invoice_id: invoice_id)
    transaction = create(:transaction, invoice_id: invoice_id)
    transaction2 = create(:transaction, invoice_id: invoice_id_2)
    transaction3 = create(:failed_transaction, invoice_id: invoice_id_3)

    get "/api/v1/merchants/#{merchant.id}/revenue"
    expect(response).to be_successful

    revenue = JSON.parse(response.body)

    expect(merchant["id"]).to eq(merchant.id)
    expect(revenue).to eq("revenue"=>"450.0")
  end

  it 'returns total revenue for date for all merchants' do
    item = create(:item)
    invoice = create(:invoice, updated_at: '2012-03-25 09:54:09 UTC')
    t = Transaction.create(invoice: invoice, result: 'success', credit_card_number: 12345)
    ii = invoice.invoice_items.create(unit_price: 5000, quantity: 5, item: item)
    create_list(:invoice_item, 2)

    get '/api/v1/merchants/revenue?date=2012-03-25'
    revenue = JSON.parse(response.body)
    expect(revenue["total_revenue"]).to eq("250.0")
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

  it 'returns the total revenue of a merchant for successful transactions for a specific date' do
    merch1 = create(:merchant)
    merch2 = create(:merchant)
    invoice = create(:invoice, merchant_id: merch1.id)
    invoice_item = create(:invoice_item, invoice_id: invoice.id)
    invoice_item = create(:invoice_item)
    transaction = create(:transaction, invoice_id: invoice.id)
    transaction2 = create(:transaction, invoice_id: invoice.id)
    transaction3 = create(:failed_transaction, invoice_id: invoice.id)


    get "/api/v1/merchants/#{merch1.id}/revenue?date=#{invoice_item.created_at}"

    expect(response).to be_success

    revenue = JSON.parse(response.body)
    expect(revenue).to eq("revenue"=>"300.0")
  end
end
