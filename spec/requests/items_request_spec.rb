require 'rails_helper'

describe 'Items API' do
  it 'sends a list of items' do
    create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_successful
    items = JSON.parse(response.body)
    expect(items.count).to eq(3)
  end

  it 'can get one item by its id' do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_successful
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(id)
  end

  it 'can find an item by id' do
    id = create(:item).id

    get "/api/v1/items/find?id=#{id}"

    expect(response).to be_successful
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(id)
  end

  it 'can find an item by description' do
    create_list(:item, 2)
    original_item = create(:other_item)

    get "/api/v1/items/find?description=#{original_item.description}"
    expect(response).to be_successful
    item = JSON.parse(response.body)
    expect(item["id"]).to eq(original_item.id)
  end
end
