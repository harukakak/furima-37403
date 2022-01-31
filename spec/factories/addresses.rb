FactoryBot.define do
  factory :address do
    number             { 4242424242424242 }
    exp_month          { 3 }
    exp_year           { 33 }
    cvc                { 123 }
    post_code          { Faker::Address.zip }
    area_id            { 2 }
    city               { Faker::Address.city }
    address_number     { Faker::Address.zip_code }
    build              { Faker::Address.street_suffix }
    telephone_number   { Faker::Number.leading_zero_number(digits: 10) }
  end
end
