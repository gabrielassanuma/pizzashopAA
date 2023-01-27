FactoryBot.define do
  factory :product do
    name { "product" }
    description { "good description" } 
    price { 10 }
    subclass { "pizza "}
    active { true } 

    trait :invalid do
      name { "" }
    end
  end
end