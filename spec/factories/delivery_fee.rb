FactoryBot.define do
  factory :delivery_fee do
    zone { "A" }
    price { 1 }

    trait :invalid do
      price { "" }
    end
  end
end