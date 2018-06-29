require 'rails_helper'

describe 'Customer API' do
  it 'sends a list of customers' do
    create_list(:customer, 4)

    get '/api/v1/customers'
    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers.count).to eq(4)
  end

  it 'sends a specific customers' do
    create_list(:customer, 4)
    id = create(:customer).id

    get "/api/v1/customers/#{id}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer['id']).to eq(id)
  end

  it 'finds a specific customer for params' do
    name = 'Troyke'
    create_list(:customer, 4)
    create(:customer, last_name: name)

    get "/api/v1/customers/find?last_name=#{name}"
    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer['last_name']).to eq(name)
  end
end
