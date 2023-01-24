FactoryBot.define do
  factory :order_product do
    association :product
    association :ddriver
    association :cart
    quantity { 1 }

    trait :invalid do
    end
  end
end