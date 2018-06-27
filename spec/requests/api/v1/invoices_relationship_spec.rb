require 'rails_helper'

describe 'Invoice API relationship end point' do
  it 'returns transactions for a specific invoice' do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    create(:transaction, invoice_id: invoice.id)
    create(:transaction, invoice_id: invoice.id)
    create(:transaction, invoice_id: invoice2.id)

    get "/api/v1/invoices/#{invoice.id}/transactions"
    expect(response).to be_success

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(2)
  end

  it 'returns invoice items for a single invoice' do
    invoice = create(:invoice)
    invoice2 = create(:invoice)
    item = create(:item)
    InvoiceItem.create!(invoice_id: invoice2.id, item_id: item.id, quantity: 2, unit_price: 234)
    InvoiceItem.create!(invoice_id: invoice.id, item_id: item.id, quantity: 1, unit_price: 1000)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"
    expect(response).to be_success

    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(1)
  end

  it 'returns items for a single invoice' do
    create_list(:item, 2)
    invoice = create(:invoice)
    item = create(:item)
    InvoiceItem.create!(invoice_id: invoice.id, item_id: item.id, quantity: 2, unit_price: 234)

    get "/api/v1/invoices/#{invoice.id}/items"
    expect(response).to be_success

    items = JSON.parse(response.body)

    expect(items.count).to eq(1)
  end

  it 'returns customer for a specific invoice' do
    customer = create(:customer)
    create(:customer)
    invoice = create(:invoice, customer_id: customer.id)

    get "/api/v1/invoices/#{invoice.id}/customer"
    expect(response).to be_success

    customer = JSON.parse(response.body)

    expect(customer['id']).to eq(invoice.customer.id)
  end

  it 'returns merchant for a specific invoice' do
    merchant = create(:merchant)
    create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id)

    get "/api/v1/invoices/#{invoice.id}/merchant"
    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant['id']).to eq(invoice.merchant.id)
  end
end
