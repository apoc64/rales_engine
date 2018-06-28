require 'rails_helper'

describe 'Customer Relationships API' do
  it 'loads all invoices for that customer' do
    create_list(:invoice, 2)
    customer = create(:customer)
    create_list(:invoice, 3, customer_id: customer.id)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_successful
    invoices = JSON.parse(response.body)
    expect(invoices.count).to eq(3)
  end
end
