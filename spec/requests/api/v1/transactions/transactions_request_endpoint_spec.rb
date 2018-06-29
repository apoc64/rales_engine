require 'rails_helper'

describe 'Transaction API' do
  it 'sends a list of transactions' do
    create_list(:transaction, 3)

    get '/api/v1/transactions'
    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(3)
  end

  it "can get one transaction by its id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(id)
  end

  it "can destroy an transaction" do
    transaction = create(:transaction)

    expect(Transaction.count).to eq(1)

    delete "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_successful
    expect(Transaction.count).to eq(0)
    expect{Transaction.find(transaction.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "can return single transaction by params" do
    result = 'success'
    create(:transaction)
    create(:failed_transaction)

    get "/api/v1/transactions/find?result=#{result}"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions['result']).to eq(result)
  end

  it "can find all items for single params" do
    result = 'success'
    create_list(:transaction, 2)
    create_list(:failed_transaction, 6)

    get "/api/v1/transactions/find_all?result=#{result}"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(2)
    transactions.each do |transaction|
      expect(transaction['result']).to eq(result)
    end
  end

  it "can find a random transaction" do
    result = 'success'
    create_list(:transaction, 2)
    create_list(:failed_transaction, 6)

    get "/api/v1/transactions/random"
    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions.class).to eq(Hash)
    expect(transactions['credit_card_number'].class).to eq(String)
  end
end
