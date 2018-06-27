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

  it 'can find an invoice_item by item id' do
    create_list(:invoice_item, 2)
    original_ii = create(:invoice_item)

    get "/api/v1/invoice_items/find?item_id=#{original_ii.item_id}"

    expect(response).to be_successful
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(original_ii.id)
  end

  it 'can find an invoice_item by invoice id' do
    create_list(:invoice_item, 2)
    original_ii = create(:invoice_item)

    get "/api/v1/invoice_items/find?invoice_id=#{original_ii.invoice_id}"

    expect(response).to be_successful
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(original_ii.id)
  end

  it 'can find an invoice_item by quantity' do
    create_list(:invoice_item, 2)
    original_ii = create(:invoice_item, quantity: 7)

    get "/api/v1/invoice_items/find?quantity=7"

    expect(response).to be_successful
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(original_ii.id)
  end

  it 'can find an invoice_item by unit_price' do
    create_list(:invoice_item, 2)
    original_ii = create(:invoice_item, unit_price: 7000)

    get "/api/v1/invoice_items/find?unit_price=70"

    expect(response).to be_successful
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(original_ii.id)
  end

  it 'can find an invoice_item by created_at' do
    create_list(:invoice_item, 2)
    original_ii = create(:invoice_item, created_at: '2012-03-27T14:57:57.000Z')

    get "/api/v1/invoice_items/find?created_at=2012-03-27T14:57:57.000Z"

    expect(response).to be_successful
    invoice_item = JSON.parse(response.body)
    expect(invoice_item["id"]).to eq(original_ii.id)
  end

  it 'can find all invoice_items by id' do
    create_list(:invoice_item, 2)
    original_ii = create(:invoice_item)

    get "/api/v1/invoice_items/find_all?id=#{original_ii.id}"

    expect(response).to be_successful
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(1)
  end

  it 'can find all invoice_items by item_id' do
    create_list(:invoice_item, 3)
    original_ii = create(:invoice_item)
    create(:invoice_item, item_id: original_ii.item_id)

    get "/api/v1/invoice_items/find_all?item_id=#{original_ii.item_id}"

    expect(response).to be_successful
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(2)
  end

  it 'can find all invoice_items by invoice_id' do
    create_list(:invoice_item, 3)
    original_ii = create(:invoice_item)
    create(:invoice_item, invoice_id: original_ii.invoice_id)

    get "/api/v1/invoice_items/find_all?invoice_id=#{original_ii.invoice_id}"

    expect(response).to be_successful
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(2)
  end

  it 'can find all invoice_items by quantity' do
    create_list(:invoice_item, 3)
    original_ii = create(:invoice_item, quantity: 7)
    create(:invoice_item, quantity: original_ii.quantity)

    get "/api/v1/invoice_items/find_all?quantity=#{original_ii.quantity}"

    expect(response).to be_successful
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(2)
  end

  it 'can find all invoice_items by unit_price' do
    create_list(:invoice_item, 3)
    original_ii = create(:invoice_item, unit_price: 7000)
    create(:invoice_item, unit_price: original_ii.unit_price)

    get "/api/v1/invoice_items/find_all?unit_price=70"

    expect(response).to be_successful
    invoice_items = JSON.parse(response.body)
    expect(invoice_items.count).to eq(2)
  end

    it 'can find all invoice_items by created_at' do
      create_list(:invoice_item, 3)
      original_ii = create(:invoice_item, created_at: '2012-03-27T14:57:57.000Z')
      create(:invoice_item, created_at: original_ii.created_at)

      get "/api/v1/invoice_items/find_all?created_at=2012-03-27T14:57:57.000Z"

      expect(response).to be_successful
      invoice_items = JSON.parse(response.body)
      expect(invoice_items.count).to eq(2)
    end

    it 'can find all invoice_items by updated_at' do
      create_list(:invoice_item, 3)
      original_ii = create(:invoice_item, updated_at: '2012-03-27T14:57:57.000Z')
      create(:invoice_item, updated_at: original_ii.updated_at)

      get "/api/v1/invoice_items/find_all?updated_at=2012-03-27T14:57:57.000Z"

      expect(response).to be_successful
      invoice_items = JSON.parse(response.body)
      expect(invoice_items.count).to eq(2)
    end
end
