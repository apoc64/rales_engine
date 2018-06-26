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

  task invoices: :environment do
    invoices = CSV.open('../data/sales_engine/data/invoices.csv', headers: true, header_converters: :symbol)
    invoices.each do |invoice|
      Invoice.create(id: invoice[:id],
                      customer_id: invoice[:customer_id].to_i,
                      merchant_id: invoice[:merchant_id].to_i,
                      status: invoice[:status],
                      created_at: invoice[:created_at],
                      updated_at: invoice[:updated_at])
    end
    puts "Invoices imported: #{Invoice.count}"
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

  task items: :environment do
    items = CSV.open('../data/sales_engine/data/items.csv', headers: true, header_converters: :symbol)
    items.each do |item|
      Item.create(id: item[:id],
                  name: item[:name],
                  description: item[:description],
                  unit_price: item[:unit_price],
                  merchant_id: item[:merchant_id],
                  created_at: item[:created_at],
                  updated_at: item[:updated_at])
    end
    puts "Items imported: #{Item.count}"
  end

  task invoice_items: :environment do
    invoice_items = CSV.open('../data/sales_engine/data/invoice_items.csv', headers: true, header_converters: :symbol)
    invoice_items.each do |invoice_item|
      InvoiceItem.create(id: invoice_item[:id],
                         item_id: invoice_item[:item_id],
                         invoice_id: invoice_item[:invoice_id],
                         quantity: invoice_item[:quantity],
                         unit_price: invoice_item[:unit_price],
                         created_at: invoice_item[:created_at],
                         updated_at: invoice_item[:updated_at])
    end
    puts "InvoiceItems imported: #{InvoiceItem.count}"
  end
end
