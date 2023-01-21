FactoryBot.define do
  factory :user do
    phone_number { 123456789 }
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

