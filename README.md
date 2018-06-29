# Rales Engine

This Rails API app provides json information related to an ecommerce site. 

## This app uses
* Rails 5.2
* Ruby 2.4.1

## With the following gems:
* active_model_serializers
* rspec-rails
* pry
* simplecov
* active_designer
* shoulda-matchers
* factory_bot_rails
* faker

## Installing
To install dependencies after cloning the app, run

'bundle install'

## To set up the database

'rails db:create'
'rails db:migrate'

## To load data from CSV files
This data comes from CSV files from the Sales Engine project, which can be found here: https://github.com/turingschool-examples/sales_engine/tree/master/data
Clone this project into the parent folder of this project, then run:

'rake import:merchants'

'rake import:customers'
'rake import:invoices'
'rake import:transactions'
'rake import:items'
'rake import:invoice_items'

# Testing

run 'rspec'

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
