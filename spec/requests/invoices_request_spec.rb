require 'rails_helper'

describe 'Invoice API' do
  it 'sends a list of invoices' do
    create_list(:invoice, 3)

    get "/api/v1/invoices"

    expect(response).to be_successful
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
  end

  it 'can get one invoice by its id' do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(id)
  end

  it 'can find an invoice by id' do
    id = create(:invoice).id

    get "/api/v1/invoices/find?id=#{id}"

    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(id)
  end

  it 'can find an invoice by customer id' do
    # Eliminate issue with all ids being the same:
    create_list(:merchant, 1)
    create_list(:invoice, 2)

    original_invoice = create(:invoice)

    get "/api/v1/invoices/find?customer_id=#{original_invoice.customer_id}"
    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(original_invoice.id)
  end

  it 'can find an invoice by merchant id' do
    create_list(:merchant, 1)
    create_list(:invoice, 2)

    original_invoice = create(:invoice)

    get "/api/v1/invoices/find?merchant_id=#{original_invoice.merchant_id}"
    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(original_invoice.id)
  end

  it 'can find an invoice by status' do
    create_list(:merchant, 1)
    create_list(:invoice, 2)
    original_invoice = create(:pending_invoice)

    get "/api/v1/invoices/find?status=#{original_invoice.status}"
    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(original_invoice.id)
  end

  it 'can find an invoice by created_at' do
    create_list(:merchant, 1)
    create_list(:invoice, 2)
    original_invoice = create(:pending_invoice)

    get "/api/v1/invoices/find?created_at=#{original_invoice.created_at}"
    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(original_invoice.id)
  end

  it 'can find an invoice by created_at' do
    create_list(:merchant, 1)
    create_list(:invoice, 2)
    original_invoice = create(:pending_invoice)

    get "/api/v1/invoices/find?updated_at=#{original_invoice.updated_at}"
    expect(response).to be_successful
    invoice = JSON.parse(response.body)
    expect(invoice["id"]).to eq(original_invoice.id)
  end
end
