FactoryBot.define do
  factory :delivery_fee do
    id { 1 }
    zone { "A" }
    price { 1 }

    trait :invalid do
      price { "" }
    end
  end
end