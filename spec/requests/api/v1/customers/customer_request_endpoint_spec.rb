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

  it 'finds all matching customers for params' do
    name = 'Troyke'
    name2 = 'Steve'
    t = create_list(:customer, 6, last_name: name)
    s = create_list(:customer, 2, last_name: name2)

    get "/api/v1/customers/find_all?last_name=#{name}"
    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers.count).to eq(6)
    customers.each do |customer|
      expect(customer['last_name']).to eq(name)
    end
  end

  it "can find a random customer" do
    customer = create(:customer, last_name: 'Troyke')
    create_list(:customer, 2)

    get "/api/v1/customers/random"
    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer.class).to eq(Hash)
    expect(customer['last_name'].class).to eq(String)
  end
end
