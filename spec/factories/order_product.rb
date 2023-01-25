FactoryBot.define do
  factory :order_product do
    association :product
    order_id { "" }
    cart_id { 1 }
    quantity { 1 }

    trait :invalid do
    end
  end
end