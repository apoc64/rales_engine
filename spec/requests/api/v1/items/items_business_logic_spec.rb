require 'rails_helper'

describe 'Items Business Logic API' do
  it 'returns top items by revenue' do
    create_list(:item, 2)
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item1.id)
    create(:invoice_item, invoice_id: invoice2.id, item_id: item1.id)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item2.id)

    get "/api/v1/items/most_revenue?quantity=2"

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.count).to eq(2)
    expect(items.first["id"]).to eq(item1.id)
  end

  it 'returns top items by number sold' do
    create_list(:item, 2)
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)
    invoice1 = create(:invoice)
    invoice2 = create(:invoice)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item2.id, quantity: 7)
    create(:invoice_item, invoice_id: invoice2.id, item_id: item1.id)
    create(:invoice_item, invoice_id: invoice1.id, item_id: item2.id)

    get "/api/v1/items/most_items?quantity=2"

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.count).to eq(2)
    expect(items.first["id"]).to eq(item2.id)
  end
end
