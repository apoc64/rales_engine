FactoryBot.define do
  factory :merchant do
    name 'We sell stuff'
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
      description Faker::Lebowski.quote
      unit_price 5000
    end
  end

end
