FactoryBot.define do
  factory :item do
    title             { Faker::Coffee.origin }
    content           { Faker::Coffee.origin }
    category_id       { 2 }
    status_id         { 2 }
    charge_id         { 2 }
    area_id           { 2 }
    term_id           { 2 }
    price             { Faker::Number.number(digits: 5) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/pochacco_g.png'), filename: 'pochacco_g.png', content_type: 'image/png')
    end
  end
end
