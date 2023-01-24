FactoryBot.define do
  factory :user do
    sequence(:phone_number) { |n| "9#{n.to_s.rjust(8, '0')}" }
    additional_info { "" }
    address { "Calçada da Pampulha 27, Lisboa" }
    latitude { 38.7046306 }
    longitude { -9.167364 }
    username { "test" }
    password { 111111 }

    trait :admin do
      admin { true }
    end
  end
end

