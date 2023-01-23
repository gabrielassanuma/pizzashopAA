FactoryBot.define do
  factory :order do
    name { "product" }
    description { "good description" } 
    price { 10 }
    subclass { "pizza "}
    active { true } 

    trait :invalid do
    end
  end
end