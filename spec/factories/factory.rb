FactoryBot.define do
  factory :merchant do
    name 'We sell stuff'
  end

  factory :transaction do
    invoice
    credit_card_number 12345667890121234
    credit_card_expiration 0111
    result 'Success'
  end

  factory :invoice_item do
    item
    invoice
    unit_price 5000
    quantity 3
  end

  factory :customer do
    first_name 'Ibuy'
    last_name 'Stuff'
  end

  factory :invoice do
    merchant
    customer
    status 'shipped'

    factory :pending_invoice do
      merchant
      customer
      status 'pending'
      created_at '2012-03-25 09:54:09 UTC'
      updated_at '2012-03-26 09:54:09 UTC'
    end
  end

  factory :item do
    merchant
    name Faker::Lebowski.character
    description Faker::Lebowski.quote
    unit_price 5000

    factory :other_item do
      merchant
      name Faker::Lebowski.character
      description "This is not Vietnam,, this is Bowling! There are rules Here.."
      unit_price 5000
    end
  end

end
