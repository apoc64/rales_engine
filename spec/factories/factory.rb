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

  factory :customer do
    first_name 'Ibuy'
    last_name 'Stuff'
  end

  factory :invoice do
    merchant
    customer
    status 'shipped'
  end

end
