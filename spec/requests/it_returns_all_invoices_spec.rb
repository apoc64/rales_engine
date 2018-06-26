require 'rails_helper'

describe 'it returns all invoices' do
  it 'sends all invoices as json' do
    invoice1 = create(:invoice)

    get "/api/v1/invoices"

    expect(response).to be_successful
    body = JSON.parse(response.body)
    expect(body.first["id"]).to eq(invoice1.id)
  end
end
