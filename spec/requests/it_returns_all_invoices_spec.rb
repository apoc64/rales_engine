require 'rails_helper'

describe 'it returns all invoices' do
  it 'sends all invoices as json' do
    create_list(:invoice, 3)

    get "/api/v1/invoices"

    expect(response).to be_successful
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
  end
end
