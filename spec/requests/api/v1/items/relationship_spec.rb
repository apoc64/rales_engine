require 'rails_helper'

describe 'Item relationship end point' do
  it 'returns invoice items for specific item' do
    item = create(:item)
    invoice_item = create(:invoice_item, item_id: item.id)
    invoice_item2 = create(:invoice_item, item_id: item.id)
    create(:invoice_item)

    get "/api/v1/items/#{item.id}/invoice_items"
    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(2)
  end

  it 'returns merchant for specific item' do
    id = create(:merchant).id
    item = create(:item, merchant_id: id)
    create(:merchant)

    get "/api/v1/items/#{item.id}/merchant"
    expect(response).to be_successful

    merchant = JSON.parse(response.body)
    expect(merchant['id']).to eq(id)
  end
end
