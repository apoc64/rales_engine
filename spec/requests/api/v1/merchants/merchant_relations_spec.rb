require 'rails_helper'

describe 'Merchants Relationships API' do
  it 'loads a collection of items for one merchant' do
    id = create(:merchant).id
    create_list(:item, 3, merchant_id: id)
    create(:item)

    get "/api/v1/merchants/#{id}/items"

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end

  it 'loads a collection of invoices for one merchant' do
    id = create(:merchant).id
    create_list(:invoice, 3, merchant_id: id)
    create(:invoice)

    get "/api/v1/merchants/#{id}/invoices"

    expect(response).to be_successful
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
  end
end
