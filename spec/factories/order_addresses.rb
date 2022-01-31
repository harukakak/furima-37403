FactoryBot.define do
  factory :order_address do
    post_code          { "234-0015" }
    area_id            { 2 }
    city               { Faker::Address.city }
    address_number     { Faker::Address.zip_code }
    build              { Faker::Address.street_suffix }
    telephone_number   { Faker::Number.leading_zero_number(digits: 10) }
    token              { "tok_abcdefghijk00000000000000000" }
  end
end
