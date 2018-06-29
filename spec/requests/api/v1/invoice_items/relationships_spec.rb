require 'rails_helper'

describe 'Invoice items relationship end point' do
  it 'returns invoice for specific invoice item' do
    id = create(:invoice).id
    item = create(:item)
    invoice_item = create(:invoice_item, invoice_id: id, item_id: item.id)
    create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"
    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice['id']).to eq(id)
  end

  it 'returns item for specific invoice item' do
    id = create(:invoice).id
    item = create(:item)
    invoice_item = create(:invoice_item, invoice_id: id, item_id: item.id)
    create(:invoice_item)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"
    expect(response).to be_successful

    item2 = JSON.parse(response.body)
    expect(item['id']).to eq(item.id)
  end
end
