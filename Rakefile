require_relative 'config/application'
require 'csv'

Rails.application.load_tasks

namespace :import do
  desc 'Import CSV files'
  task merchants: :environment do
    merchants = CSV.open('../data/sales_engine/data/merchants.csv', headers: true, header_converters: :symbol)

    merchants.each do |merchant|
      Merchant.create(id: merchant[:id],
                      name: merchant[:name],
                      created_at: merchant[:created_at],
                      updated_at: merchant[:updated_at])
    end
    puts "Merchants imported: #{Merchant.count}"
  end

  task customers: :environment do
    customers = CSV.open('../data/sales_engine/data/customers.csv', headers: true, header_converters: :symbol)
    customers.each do |customer|
      Customer.create(id: customer[:id],
                      first_name: customer[:first_name],
                      last_name: customer[:last_name],
                      created_at: customer[:created_at],
                      updated_at: customer[:updated_at])
    end
    puts "Customers imported: #{Customer.count}"
  end

  task transactions: :environment do
    transactions = CSV.open('../data/sales_engine/data/transactions.csv', headers: true, header_converters: :symbol)

    transactions.each do |transaction|
      Transaction.create(id: transaction[:id],
                         invoice_id: transaction[:invoice_id],
                         credit_card_number: transaction[:credit_card_number],
                         credit_card_expiration: transaction[:credit_card_expiration],
                         result: transaction[:result],
                         created_at: transaction[:created_at],
                         updated_at: transaction[:updated_at])
    end
    puts "Transactions imported: #{Transaction.count}"
  end
end
