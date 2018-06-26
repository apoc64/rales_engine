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
  end

end
