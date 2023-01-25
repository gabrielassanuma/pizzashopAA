FactoryBot.define do
  factory :delivery_fee do
    sequence(:id) { |n| n }
    sequence(:zone) { |n| %w[A B C D][n] }
    sequence(:price) { |n| [1, 1.5, 2, 3][n] }
  end
end