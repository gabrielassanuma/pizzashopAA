FactoryBot.define do
  factory :order do
    association :user 
    total_price {  }
    order_status { "new_order" }
    association :ddriver
    take_away_name { "" }
    take_away_phone { "" }
    association :delivery_fee

    trait :invalid do
      user { "" }
    end
  end
end