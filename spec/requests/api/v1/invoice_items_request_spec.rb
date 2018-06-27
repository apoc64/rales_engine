require 'rails_helper'

describe 'Invoice Items API' do
  it 'sends a list of invoice items' do
    create_list(:invoice_item, 3)

    get "/api/v1/invoice_items"

    expect(response).to be_successful
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(3)
  end

  it 'can get one invoice item by its id' do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/#{id}"

    expect(response).to be_successful
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(id)
  end

  it 'can find an invoice_item by id' do
    id = create(:invoice_item).id

    get "/api/v1/invoice_items/find?id=#{id}"

    expect(response).to be_successful
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(id)
  end
  #
  # it 'can find an item by description' do
  #   create_list(:item, 2)
  #   original_item = create(:other_item)
  #
  #   get "/api/v1/items/find?description=#{original_item.description}"
  #   expect(response).to be_successful
  #   item = JSON.parse(response.body)
  #   expect(item["id"]).to eq(original_item.id)
  # end
end
