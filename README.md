# Rales Engine

This Rails API app provides json information related to an ecommerce marketplace site. This is part of the back end curriculum at the Turing School for Software and Design. Information related to this project can be fount here http://backend.turing.io/module3/projects/rails_engine

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
To install dependencies after cloning the app, run:

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

## Testing
To run all tests, run:
'rspec'

## Running Locally
To run this all locally, run:
'rails s'

This will launch the app on localhost:3000
Once running, the app will respopnt to HTTP GET requests with the appropriate JSON data based on Active Record and SQL queries to the PostgreSQL database.

## Authors
Justine Troyke - https://github.com/justinetroyke
Steven Schwedt - https://github.com/apoc64
