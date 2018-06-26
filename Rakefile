require_relative 'config/application'
require 'csv'

Rails.application.load_tasks

namespace :import do
  desc 'Import CSV files'
  task merchant: :environment do
    merchants = CSV.open('../data/sales_engine/data/merchants.csv', headers: true, header_converters: :symbol)

    merchants.each do |merchant|
      Merchant.create(id: merchant[:id],
                      name: merchant[:name],
                      created_at: merchant[:created_at],
                      updated_at: merchant[:updated_at])
    end
    puts "Merchants imported: #{Merchant.count}"
  end
end
