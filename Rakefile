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
end
