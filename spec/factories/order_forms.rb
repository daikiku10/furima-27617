FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture_id {Faker::Number.between(from:1, to:47)}
    city { '横浜市' }
    house_number { '1-2-3' }
    building_name { 'テストマンション101' }
    phone_number { '09012345678' }
  end
end
