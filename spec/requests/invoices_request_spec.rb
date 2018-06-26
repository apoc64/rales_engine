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
end
