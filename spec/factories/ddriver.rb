FactoryBot.define do
  factory :ddriver do
    first_name { "Elon" }
    last_name { "Musk" }
    active { true }

    trait :invalid do
      first_name { "" }
    end
  end
end